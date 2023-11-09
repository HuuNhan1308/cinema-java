/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


/**
 *
 * @author Admin
 */
@Entity
public class Room implements Serializable {

    @ManyToMany(mappedBy = "rooms")
    private List<ShowTime> showtimes;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "room_number")
    private String roomNumber;
    @Column(name = "max_seats")
    private int maxSeats;
    @Column(name = "screen_quality")
    private String screenQuality;

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getMaxSeats() {
        return maxSeats;
    }

    public void setMaxSeats(int maxSeats) {
        this.maxSeats = maxSeats;
    }

    public String getScreenQuality() {
        return screenQuality;
    }

    public void setScreenQuality(String screenQuality) {
        this.screenQuality = screenQuality;
    }

    public List<ShowTime> getShowtimes() {
        return showtimes;
    }

    public void setShowtimes(List<ShowTime> showtimes) {
        this.showtimes = showtimes;
    }
}
