/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.models;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import java.io.Serializable;
import java.math.BigDecimal;
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
    @NamedQuery(name = "Port.findByCity", query = "SELECT p FROM Port p WHERE p.city = :city"),
    @NamedQuery(name = "Port.findByLongitude", query = "SELECT p FROM Port p WHERE p.longitude = :longitude"),
    @NamedQuery(name = "Port.findByLatitude", query = "SELECT p FROM Port p WHERE p.latitude = :latitude")})
@JsonIdentityInfo(
  generator = ObjectIdGenerators.PropertyGenerator.class, 
  property = "id")
public class Port implements Serializable {

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

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "longitude")
    private BigDecimal longitude;
    @Column(name = "latitude")
    private BigDecimal latitude;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "portsId")
    @JsonManagedReference
    private Collection<Portphoto> portphotoCollection;
    @JsonIgnore
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


    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
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
        return !((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)));
    }

    @Override
    public String toString() {
        return "spring.bnb.boats.models.Port[ id=" + id + " ]";
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
}
