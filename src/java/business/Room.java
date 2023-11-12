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
import javax.persistence.SequenceGenerator;

/**
 *
 * @author Admin
 */
@Entity
public class Room implements Serializable {

  @ManyToMany(mappedBy = "rooms")
  private List<ShowTime> showtimes;

  @Id
  @GeneratedValue(
          strategy = GenerationType.SEQUENCE,
          generator = "sequence-generator"
  )
  @SequenceGenerator(
          name = "sequence-generator",
          sequenceName = "the_sequence_name"
  )
  @Column(name = "room_number")
  private int roomNumber;
  @Column(name = "max_seats")
  private int maxSeats;
  @Column(name = "screen_quality")
  private String screenQuality;

  public int getRoomNumber() {
    return roomNumber;
  }

  public void setRoomNumber(int roomNumber) {
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
