package spring.bnb.boats.models;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 * @author pkontekas
 */
@Entity
@Table(name = "users")
@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
//    @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id"),
//    @NamedQuery(name = "User.findByName", query = "SELECT u FROM User u WHERE u.name = :name"),
//    @NamedQuery(name = "User.findBySurname", query = "SELECT u FROM User u WHERE u.surname = :surname"),
//    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email"),
//    @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password"),
//    @NamedQuery(name = "User.findByLanguage", query = "SELECT u FROM User u WHERE u.language = :language"),
//    @NamedQuery(name = "User.findByCellphone", query = "SELECT u FROM User u WHERE u.cellphone = :cellphone")})
public class MyUser implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "surname")
    private String surname;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    @Column(name = "language")
    private String language;
    @Lob
    @Column(name = "profilePic")
    private byte[] profilePic;
    @Column(name = "cellphone")
    private String cellphone;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usersId")
    private Collection<Boat> boatCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usersId")
    private Collection<Booking> bookingCollection;
    @JoinColumn(name = "roles_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Role rolesId;

    public MyUser() {
    }

    public MyUser(Integer id) {
        this.id = id;
    }

    public MyUser(Integer id, String name, String surname, String email, String password) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public byte[] getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    @XmlTransient
    public Collection<Boat> getBoatCollection() {
        return boatCollection;
    }

    public void setBoatCollection(Collection<Boat> boatCollection) {
        this.boatCollection = boatCollection;
    }

    @XmlTransient
    public Collection<Booking> getBookingCollection() {
        return bookingCollection;
    }

    public void setBookingCollection(Collection<Booking> bookingCollection) {
        this.bookingCollection = bookingCollection;
    }

    public Role getRolesId() {
        return rolesId;
    }

    public void setRolesId(Role rolesId) {
        this.rolesId = rolesId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MyUser)) {
            return false;
        }
        MyUser other = (MyUser) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "spring.bnb.boats.models.User[ id=" + id + " ]";
    }
    
}
