/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author pkontekas
 */
@Entity
@Table(name = "boatphotos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Boatphoto.findAll", query = "SELECT b FROM Boatphoto b"),
    @NamedQuery(name = "Boatphoto.findById", query = "SELECT b FROM Boatphoto b WHERE b.id = :id"),
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
    @Lob
    @Column(name = "photo")
    private byte[] photo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "defaultphoto")
    private short defaultphoto;
    @JoinColumn(name = "boats_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Boat boatsId;

    public Boatphoto() {
    }

    public Boatphoto(Integer id) {
        this.id = id;
    }

    public Boatphoto(Integer id, byte[] photo, short defaultphoto) {
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
