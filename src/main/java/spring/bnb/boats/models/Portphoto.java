package spring.bnb.boats.models;

import java.io.Serializable;
import javax.persistence.Basic;
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
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author pkontekas
 */
@Entity
@Table(name = "portphotos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Portphoto.findAll", query = "SELECT p FROM Portphoto p"),
    @NamedQuery(name = "Portphoto.findById", query = "SELECT p FROM Portphoto p WHERE p.id = :id"),
    @NamedQuery(name = "Portphoto.findByDefaultphoto", query = "SELECT p FROM Portphoto p WHERE p.defaultphoto = :defaultphoto")})
public class Portphoto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Lob
    @Column(name = "photo")
    private byte[] photo;
    @Basic(optional = false)
    @Column(name = "defaultphoto")
    private short defaultphoto;
    @JoinColumn(name = "ports_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Port portsId;

    public Portphoto() {
    }

    public Portphoto(Integer id) {
        this.id = id;
    }

    public Portphoto(Integer id, byte[] photo, short defaultphoto) {
        this.id = id;
        this.photo = photo;
        this.defaultphoto = defaultphoto;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public short getDefaultphoto() {
        return defaultphoto;
    }

    public void setDefaultphoto(short defaultphoto) {
        this.defaultphoto = defaultphoto;
    }

    public Port getPortsId() {
        return portsId;
    }

    public void setPortsId(Port portsId) {
        this.portsId = portsId;
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
        if (!(object instanceof Portphoto)) {
            return false;
        }
        Portphoto other = (Portphoto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "spring.bnb.boats.models.Portphoto[ id=" + id + " ]";
    }
    
}
