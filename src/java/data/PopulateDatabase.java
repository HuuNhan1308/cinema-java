package data;

import java.util.HashMap;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import business.Customer;
import business.Movie;

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
    Map<String, String> props = new HashMap<>();
    props.put(JDBC_DRIVER, "org.postgresql.Driver");
    props.put(JDBC_URL, "jdbc:postgresql://databaseIP/db_cinema");
    props.put(JDBC_USER, "username");
    props.put(JDBC_PASSWORD, "password");

    emf = Persistence.createEntityManagerFactory("CinemaPU", props);
  }
}
