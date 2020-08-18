package spring.bnb.boats;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import spring.bnb.boats.services.AccountService;

@EnableWebSecurity
public class MyWebSecurityConfigurer extends WebSecurityConfigurerAdapter {

    @Autowired
    private AccountService accountService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()//Restrict access based on the HttpServletRequest
                .antMatchers("/admin/**").hasRole("ADMIN")//added for admin access
                //next line will be added to restrict access to boat registration to just logged in users
                //.antMatchers("/preregisterboat").hasAnyRole("ADMIN", "USER", "OWNER")
                
                //.antMatchers("/").hasAnyRole("ADMIN", "USER", "OWNER")
                .antMatchers("/").permitAll()//added permit instead of above line
                .and()
                .formLogin() //We are customizing the form login process
                .loginPage("/login.html") //This is the url to show the login page
                .loginProcessingUrl("/performlogin")//login form will POST data to this URL to check email and password
                .defaultSuccessUrl("/", true)//new line
                .usernameParameter("email") // custom WebSecurityConfigurerAdapter knows that "email" is a principal parameter now
                .permitAll()
                .and()
                .logout().permitAll()
                .logoutUrl("/performlogout")//new line
                .deleteCookies("JSESSIONID")//new line
                .and()
                .exceptionHandling().accessDeniedPage("/access-denied");
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(accountService);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }

}
