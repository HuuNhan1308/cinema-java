/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.sql.Time;
import java.sql.Date;
import java.util.List;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import org.eclipse.persistence.annotations.UuidGenerator;

/**
 *
 * @author Admin
 */
@Entity
public class ShowTime implements Serializable {

    @OneToMany(mappedBy = "showtime")
    private List<Ticket> tickets;

    @ManyToMany
    @JoinTable(
            name = "showtime_room",
            joinColumns = @JoinColumn(name = "showtime_id"),
            inverseJoinColumns = @JoinColumn(name = "room_id"))
    private List<Room> rooms;
    
    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @Id
    @UuidGenerator(name = "UUID")
    @GeneratedValue(generator = "UUID")
    private String id;
    @Column(name = "show_date")
    private Date date;
    @Column(name = "start_time")
    private Time starTime;
    private int price;

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    public List<Room> getRooms() {
        return rooms;
    }

    public void setRooms(List<Room> rooms) {
        this.rooms = rooms;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public Time getStarTime() {
        return starTime;
    }

    public void setStarTime(Time starTime) {
        this.starTime = starTime;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
