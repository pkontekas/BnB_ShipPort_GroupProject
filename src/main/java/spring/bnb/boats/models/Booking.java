package spring.bnb.boats.models;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author pkontekas
 */
@Entity
@Table(name = "bookings")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Booking.findAll", query = "SELECT b FROM Booking b"),
    @NamedQuery(name = "Booking.findById", query = "SELECT b FROM Booking b WHERE b.id = :id"),
    @NamedQuery(name = "Booking.findByStartDate", query = "SELECT b FROM Booking b WHERE b.startDate = :startDate"),
    @NamedQuery(name = "Booking.findByEndDate", query = "SELECT b FROM Booking b WHERE b.endDate = :endDate"),
    @NamedQuery(name = "Booking.findByFinalPrice", query = "SELECT b FROM Booking b WHERE b.finalPrice = :finalPrice"),
    @NamedQuery(name = "Booking.findByPassengers", query = "SELECT b FROM Booking b WHERE b.passengers = :passengers"),
    @NamedQuery(name = "Booking.findByOwnerNotes", query = "SELECT b FROM Booking b WHERE b.ownerNotes = :ownerNotes")})
public class Booking implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "start_date")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "final_price")
    private BigDecimal finalPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "passengers")
    private int passengers;
    @Size(max = 200)
    @Column(name = "owner_notes")
    private String ownerNotes;
    @JoinColumn(name = "accounts_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Account accountsId;
    @JoinColumn(name = "boats_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Boat boatsId;
    @JoinColumn(name = "reviews_id", referencedColumnName = "id")
    //had changed next line from false to true
    @ManyToOne(optional = true)
    private Review reviewsId;

    public Booking() {
    }

    public Booking(Integer id) {
        this.id = id;
    }

    public Booking(Integer id, Date startDate, Date endDate, BigDecimal finalPrice, int passengers) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.finalPrice = finalPrice;
        this.passengers = passengers;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public BigDecimal getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(BigDecimal finalPrice) {
        this.finalPrice = finalPrice;
    }

    public int getPassengers() {
        return passengers;
    }

    public void setPassengers(int passengers) {
        this.passengers = passengers;
    }

    public String getOwnerNotes() {
        return ownerNotes;
    }

    public void setOwnerNotes(String ownerNotes) {
        this.ownerNotes = ownerNotes;
    }

    public Account getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(Account accountsId) {
        this.accountsId = accountsId;
    }

    public Boat getBoatsId() {
        return boatsId;
    }

    public void setBoatsId(Boat boatsId) {
        this.boatsId = boatsId;
    }

    public Review getReviewsId() {
        return reviewsId;
    }

    public void setReviewsId(Review reviewsId) {
        this.reviewsId = reviewsId;
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
        if (!(object instanceof Booking)) {
            return false;
        }
        Booking other = (Booking) object;
        return !((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)));
    }

    @Override
    public String toString() {
        return "spring.bnb.boats.models.Booking[ id=" + id + " ]";
    }
    
}
