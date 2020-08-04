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
@Table(name = "reviews")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Review.findAll", query = "SELECT r FROM Review r"),
    @NamedQuery(name = "Review.findById", query = "SELECT r FROM Review r WHERE r.id = :id"),
    @NamedQuery(name = "Review.findByStars", query = "SELECT r FROM Review r WHERE r.stars = :stars"),
    @NamedQuery(name = "Review.findByGeneralMaintenance", query = "SELECT r FROM Review r WHERE r.generalMaintenance = :generalMaintenance"),
    @NamedQuery(name = "Review.findByCleanliness", query = "SELECT r FROM Review r WHERE r.cleanliness = :cleanliness"),
    @NamedQuery(name = "Review.findByComfort", query = "SELECT r FROM Review r WHERE r.comfort = :comfort"),
    @NamedQuery(name = "Review.findByHarbour", query = "SELECT r FROM Review r WHERE r.harbour = :harbour"),
    @NamedQuery(name = "Review.findByHospitality", query = "SELECT r FROM Review r WHERE r.hospitality = :hospitality"),
    @NamedQuery(name = "Review.findByValueForMoney", query = "SELECT r FROM Review r WHERE r.valueForMoney = :valueForMoney"),
    @NamedQuery(name = "Review.findByComment", query = "SELECT r FROM Review r WHERE r.comment = :comment")})
public class Review implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "stars")
    private short stars;
    @Column(name = "general_maintenance")
    private Short generalMaintenance;
    @Column(name = "cleanliness")
    private Short cleanliness;
    @Column(name = "comfort")
    private Short comfort;
    @Column(name = "harbour")
    private Short harbour;
    @Column(name = "hospitality")
    private Short hospitality;
    @Column(name = "value_for_money")
    private Short valueForMoney;
    @Size(max = 200)
    @Column(name = "comment")
    private String comment;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "reviewsId")
    private Collection<Booking> bookingCollection;

    public Review() {
    }

    public Review(Integer id) {
        this.id = id;
    }

    public Review(Integer id, short stars) {
        this.id = id;
        this.stars = stars;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public short getStars() {
        return stars;
    }

    public void setStars(short stars) {
        this.stars = stars;
    }

    public Short getGeneralMaintenance() {
        return generalMaintenance;
    }

    public void setGeneralMaintenance(Short generalMaintenance) {
        this.generalMaintenance = generalMaintenance;
    }

    public Short getCleanliness() {
        return cleanliness;
    }

    public void setCleanliness(Short cleanliness) {
        this.cleanliness = cleanliness;
    }

    public Short getComfort() {
        return comfort;
    }

    public void setComfort(Short comfort) {
        this.comfort = comfort;
    }

    public Short getHarbour() {
        return harbour;
    }

    public void setHarbour(Short harbour) {
        this.harbour = harbour;
    }

    public Short getHospitality() {
        return hospitality;
    }

    public void setHospitality(Short hospitality) {
        this.hospitality = hospitality;
    }

    public Short getValueForMoney() {
        return valueForMoney;
    }

    public void setValueForMoney(Short valueForMoney) {
        this.valueForMoney = valueForMoney;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @XmlTransient
    public Collection<Booking> getBookingCollection() {
        return bookingCollection;
    }

    public void setBookingCollection(Collection<Booking> bookingCollection) {
        this.bookingCollection = bookingCollection;
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
        if (!(object instanceof Review)) {
            return false;
        }
        Review other = (Review) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "spring.bnb.boats.models.Review[ id=" + id + " ]";
    }
    
}
