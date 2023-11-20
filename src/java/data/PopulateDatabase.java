/* If the Products table in the music_jpa database doesn't contain any records,
 * you can use this class to populate the Product table.
 *
 * To do this in NetBeans, press SHIFT+F6
 * while in this window, or right click and select Run File. It is normal for
 * it to take a few minutes to run.
 *
 * After you have done this, you will want to change the
 * javax.persistence.schema-generation.database.action value in the
 * persistence.xml file to "none". Otherwise, the application will pause for
 * two or three minutes each time you start it when it first makes a database
 * call.
 */
package data;

import java.util.HashMap;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import business.Customer;
import business.Movie;
import business.Room;
import business.ShowTime;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import javax.persistence.TypedQuery;

import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_DRIVER;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_PASSWORD;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_URL;
import static org.eclipse.persistence.config.EntityManagerProperties.JDBC_USER;

public class PopulateDatabase {

  private static EntityManagerFactory emf;

  public static void insertProduct(Customer user) {
    EntityManager em = emf.createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(user);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
    } finally {
      em.close();
    }
  }

  public static void insertMovie(Movie movie) {
    EntityManager em = emf.createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(movie);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
    } finally {
      em.close();
    }
  }

  public static void main(String[] args) {
    Map props = new HashMap();
    props.put(JDBC_DRIVER, "org.postgresql.Driver");
    props.put(JDBC_URL,
        "jdbc:postgresql://dpg-cl4qv5472pts739l9jhg-a.singapore-postgres.render.com:5432/cinema_db_jnzp");
    props.put(JDBC_USER, "admin");
    props.put(JDBC_PASSWORD, "cs0d8T87UEpP11wQ5Ce4zlJ05MMWCm4t");

    emf = Persistence.createEntityManagerFactory("FinalWebPU", props);

    // set movie
    // Movie myMovie = new Movie();
    // myMovie.setMainActor("Haruma Miura");
    // myMovie.setDirector("Hajime Isayama");
    // myMovie.setDuration(Time.valueOf(LocalTime.of(1, 30, 0)));
    // myMovie.setGenre("Action, Anime, Human");
    // myMovie.setTitle("Attack on Titan 4 part 2");
    // myMovie.setImg("AOT.png");
    //
    // insertMovie(myMovie);
    // set Room
    // Room myRoom = new Room();
    // myRoom.setMaxSeats(40);
    // myRoom.setScreenQuality("Full HD");
    // RoomDB.insert(myRoom);
    //
    // Room myRoom2 = new Room();
    // myRoom2.setMaxSeats(60);
    // myRoom2.setScreenQuality("4K");
    // RoomDB.insert(myRoom2);
    // set Customer
  }
}
