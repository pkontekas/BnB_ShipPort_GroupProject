package spring.bnb.boats.dto;

import java.math.BigDecimal;

/**
 * @author pkontekas
 */
public class BoatDto {
    
    private Integer id;
    private String manufacturer;
    private String model;
    private String boatType;
    private BigDecimal boatLength;
    private int constructionYear;
    private int passengerCapacity;
    private int beds;
    private int cruiseSpeed;
    private String fuel;
    private double price;
    
    private String city;
    private String portName;
    
    private String boatPhoto;
    
    private double starsAvg;

    public BoatDto(Integer id, String manufacturer, String model, String boatType, BigDecimal boatLength, int constructionYear, int passengerCapacity, int beds, int cruiseSpeed, String fuel, double price, String city, String portName, String boatPhoto, double starsAvg) {
        this.id = id;
        this.manufacturer = manufacturer;
        this.model = model;
        this.boatType = boatType;
        this.boatLength = boatLength;
        this.constructionYear = constructionYear;
        this.passengerCapacity = passengerCapacity;
        this.beds = beds;
        this.cruiseSpeed = cruiseSpeed;
        this.fuel = fuel;
        this.price = price;
        this.city = city;
        this.portName = portName;
        this.boatPhoto = boatPhoto;
        this.starsAvg = starsAvg;
    }
    
    public BoatDto(){}

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

    public int getConstructionYear() {
        return constructionYear;
    }

    public void setConstructionYear(int constructionYear) {
        this.constructionYear = constructionYear;
    }

    public int getPassengerCapacity() {
        return passengerCapacity;
    }

    public void setPassengerCapacity(int passengerCapacity) {
        this.passengerCapacity = passengerCapacity;
    }

    public int getBeds() {
        return beds;
    }

    public void setBeds(int beds) {
        this.beds = beds;
    }

    public int getCruiseSpeed() {
        return cruiseSpeed;
    }

    public void setCruiseSpeed(int cruiseSpeed) {
        this.cruiseSpeed = cruiseSpeed;
    }

    public String getFuel() {
        return fuel;
    }

    public void setFuel(String fuel) {
        this.fuel = fuel;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPortName() {
        return portName;
    }

    public void setPortName(String portName) {
        this.portName = portName;
    }

    public String getBoatPhoto() {
        return boatPhoto;
    }

    public void setBoatPhoto(String boatPhoto) {
        this.boatPhoto = boatPhoto;
    } 

    public double getStarsAvg() {
        return starsAvg;
    }

    public void setStarsAvg(double starsAvg) {
        this.starsAvg = starsAvg;
    }
    
    
}
