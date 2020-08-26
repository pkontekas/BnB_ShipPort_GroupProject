package spring.bnb.boats.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author pkontekas
 */
@Entity
@Table(name = "boatphotos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Boatphoto.findAll", query = "SELECT b FROM Boatphoto b"),
    @NamedQuery(name = "Boatphoto.findById", query = "SELECT b FROM Boatphoto b WHERE b.id = :id"),
    @NamedQuery(name = "Boatphoto.findByPhotoName", query = "SELECT b FROM Boatphoto b WHERE b.photoName = :photoName"),
    @NamedQuery(name = "Boatphoto.findByDefaultphoto", query = "SELECT b FROM Boatphoto b WHERE b.defaultphoto = :defaultphoto")})
public class Boatphoto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "photo_name")
    private String photoName;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Column(name = "photo")
    @JsonIgnore
    private byte[] photo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "defaultphoto", columnDefinition = "TINYINT(1)")
    private boolean defaultphoto;
    @JoinColumn(name = "boats_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Boat boatsId;

    public Boatphoto() {
    }

    public Boatphoto(Integer id) {
        this.id = id;
    }

    public Boatphoto(Integer id, String photoName, byte[] photo, boolean defaultphoto) {
        this.id = id;
        this.photoName = photoName;
        this.photo = photo;
        this.defaultphoto = defaultphoto;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public boolean getDefaultphoto() {
        return defaultphoto;
    }

    public void setDefaultphoto(boolean defaultphoto) {
        this.defaultphoto = defaultphoto;
    }

    public Boat getBoatsId() {
        return boatsId;
    }

    public void setBoatsId(Boat boatsId) {
        this.boatsId = boatsId;
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
        if (!(object instanceof Boatphoto)) {
            return false;
        }
        Boatphoto other = (Boatphoto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "spring.bnb.boats.models.Boatphoto[ id=" + id + " ]";
    }
    
}
