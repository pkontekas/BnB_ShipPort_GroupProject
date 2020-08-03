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
public class MyWebSecurityConfigurer extends WebSecurityConfigurerAdapter{
    
    @Autowired
    private AccountService accountService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//                auth.inMemoryAuthentication()
//                .withUser("user").password("{noop}1234").roles("USER")
//                .and()
//                .withUser("admin").password("{noop}4321").roles("ADMIN", "USER");
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()//Restrict access based on the HttpServletRequest
                .antMatchers("/").hasAnyRole("ADMIN", "USER", "OWNER")
                .and()
                .formLogin() //We are customizing the form login process
                .loginPage("/loginPage") //This is the url to show the login page
                .usernameParameter("email") // custom WebSecurityConfigurerAdapter knows that "email" is a principal parameter now
                .permitAll()
                .and()
                .logout()
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
