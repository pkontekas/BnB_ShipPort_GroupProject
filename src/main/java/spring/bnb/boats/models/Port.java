/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author pkontekas
 */
@Entity
@Table(name = "ports")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Port.findAll", query = "SELECT p FROM Port p"),
    @NamedQuery(name = "Port.findById", query = "SELECT p FROM Port p WHERE p.id = :id"),
    @NamedQuery(name = "Port.findByPortName", query = "SELECT p FROM Port p WHERE p.portName = :portName"),
    @NamedQuery(name = "Port.findByCity", query = "SELECT p FROM Port p WHERE p.city = :city")})
public class Port implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "port_name")
    private String portName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "city")
    private String city;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "portsId")
    private Collection<Portphoto> portphotoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "portsId")
    private Collection<Boat> boatCollection;

    public Port() {
    }

    public Port(Integer id) {
        this.id = id;
    }

    public Port(Integer id, String portName, String city) {
        this.id = id;
        this.portName = portName;
        this.city = city;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPortName() {
        return portName;
    }

    public void setPortName(String portName) {
        this.portName = portName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @XmlTransient
    public Collection<Portphoto> getPortphotoCollection() {
        return portphotoCollection;
    }

    public void setPortphotoCollection(Collection<Portphoto> portphotoCollection) {
        this.portphotoCollection = portphotoCollection;
    }

    @XmlTransient
    public Collection<Boat> getBoatCollection() {
        return boatCollection;
    }

    public void setBoatCollection(Collection<Boat> boatCollection) {
        this.boatCollection = boatCollection;
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
        if (!(object instanceof Port)) {
            return false;
        }
        Port other = (Port) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "spring.bnb.boats.models.Port[ id=" + id + " ]";
    }
    
}
