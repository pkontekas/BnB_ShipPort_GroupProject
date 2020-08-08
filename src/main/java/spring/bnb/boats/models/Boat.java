package spring.bnb.boats.models;

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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 * @author pkontekas
 */
@Entity
@Table(name = "boats")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Boat.findAll", query = "SELECT b FROM Boat b"),
    @NamedQuery(name = "Boat.findById", query = "SELECT b FROM Boat b WHERE b.id = :id"),
    @NamedQuery(name = "Boat.findByManufacturer", query = "SELECT b FROM Boat b WHERE b.manufacturer = :manufacturer"),
    @NamedQuery(name = "Boat.findByModel", query = "SELECT b FROM Boat b WHERE b.model = :model"),
    @NamedQuery(name = "Boat.findByConstructionYear", query = "SELECT b FROM Boat b WHERE b.constructionYear = :constructionYear"),
    @NamedQuery(name = "Boat.findByBoatType", query = "SELECT b FROM Boat b WHERE b.boatType = :boatType"),
    @NamedQuery(name = "Boat.findByBoatLength", query = "SELECT b FROM Boat b WHERE b.boatLength = :boatLength"),
    @NamedQuery(name = "Boat.findByPassengerCapacity", query = "SELECT b FROM Boat b WHERE b.passengerCapacity = :passengerCapacity"),
    @NamedQuery(name = "Boat.findByEnginePower", query = "SELECT b FROM Boat b WHERE b.enginePower = :enginePower"),
    @NamedQuery(name = "Boat.findByFuel", query = "SELECT b FROM Boat b WHERE b.fuel = :fuel"),
    @NamedQuery(name = "Boat.findByFuelTankCapacity", query = "SELECT b FROM Boat b WHERE b.fuelTankCapacity = :fuelTankCapacity"),
    @NamedQuery(name = "Boat.findByCruiseSpeed", query = "SELECT b FROM Boat b WHERE b.cruiseSpeed = :cruiseSpeed"),
    @NamedQuery(name = "Boat.findByMaxSpeed", query = "SELECT b FROM Boat b WHERE b.maxSpeed = :maxSpeed"),
    @NamedQuery(name = "Boat.findByCurrentPrice", query = "SELECT b FROM Boat b WHERE b.currentPrice = :currentPrice")})
public class Boat implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 45)
    @Column(name = "manufacturer")
    private String manufacturer;
    @Size(max = 45)
    @Column(name = "model")
    private String model;
    @Column(name = "construction_year")
    private Integer constructionYear;
    @Size(max = 45)
    @Column(name = "boat_type")
    private String boatType;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "boat_length")
    private BigDecimal boatLength;
    @Column(name = "passenger_capacity")
    private Integer passengerCapacity;
    @Size(max = 45)
    @Column(name = "engine_power")
    private String enginePower;
    @Size(max = 45)
    @Column(name = "fuel")
    private String fuel;
    @Column(name = "fuel_tank_capacity")
    private BigDecimal fuelTankCapacity;
    @Column(name = "cruise_speed")
    private Integer cruiseSpeed;
    @Column(name = "max_speed")
    private Integer maxSpeed;
    @Basic(optional = false)
    @NotNull
    @Column(name = "current_price")
    private BigDecimal currentPrice;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "boatsId")
    private Collection<Boatphoto> boatphotoCollection;
    @JoinColumn(name = "accounts_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Account accountsId;
    @JoinColumn(name = "ports_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Port portsId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "boatsId")
    private Collection<Booking> bookingCollection;

    public Boat() {
    }

    public Boat(Integer id) {
        this.id = id;
    }

    public Boat(Integer id, BigDecimal currentPrice) {
        this.id = id;
        this.currentPrice = currentPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Integer getConstructionYear() {
        return constructionYear;
    }

    public void setConstructionYear(Integer constructionYear) {
        this.constructionYear = constructionYear;
    }

    public String getBoatType() {
        return boatType;
    }

    public void setBoatType(String boatType) {
        this.boatType = boatType;
    }

    public BigDecimal getBoatLength() {
        return boatLength;
    }

    public void setBoatLength(BigDecimal boatLength) {
        this.boatLength = boatLength;
    }

    public Integer getPassengerCapacity() {
        return passengerCapacity;
    }

    public void setPassengerCapacity(Integer passengerCapacity) {
        this.passengerCapacity = passengerCapacity;
    }

    public String getEnginePower() {
        return enginePower;
    }

    public void setEnginePower(String enginePower) {
        this.enginePower = enginePower;
    }

    public String getFuel() {
        return fuel;
    }

    public void setFuel(String fuel) {
        this.fuel = fuel;
    }

    public BigDecimal getFuelTankCapacity() {
        return fuelTankCapacity;
    }

    public void setFuelTankCapacity(BigDecimal fuelTankCapacity) {
        this.fuelTankCapacity = fuelTankCapacity;
    }

    public Integer getCruiseSpeed() {
        return cruiseSpeed;
    }

    public void setCruiseSpeed(Integer cruiseSpeed) {
        this.cruiseSpeed = cruiseSpeed;
    }

    public Integer getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(Integer maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public BigDecimal getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(BigDecimal currentPrice) {
        this.currentPrice = currentPrice;
    }

    @XmlTransient
    public Collection<Boatphoto> getBoatphotoCollection() {
        return boatphotoCollection;
    }

    public void setBoatphotoCollection(Collection<Boatphoto> boatphotoCollection) {
        this.boatphotoCollection = boatphotoCollection;
    }

    public Account getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(Account accountsId) {
        this.accountsId = accountsId;
    }

    public Port getPortsId() {
        return portsId;
    }

    public void setPortsId(Port portsId) {
        this.portsId = portsId;
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
        if (!(object instanceof Boat)) {
            return false;
        }
        Boat other = (Boat) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "spring.bnb.boats.models.Boat[ id=" + id + " ]";
    }
    
}
