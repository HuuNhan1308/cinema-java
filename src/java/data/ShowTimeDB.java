package data;

import business.Movie;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import business.ShowTime;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Admin
 */
public class ShowTimeDB {

  public static void insert(ShowTime showtime) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.persist(showtime);
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static void delete(ShowTime showTime) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    EntityTransaction trans = em.getTransaction();
    trans.begin();
    try {
      em.remove(em.merge(showTime));
      trans.commit();
    } catch (Exception e) {
      System.out.println(e);
      trans.rollback();
    } finally {
      em.close();
    }
  }

  public static ShowTime selectShowTime(String showTimeID) {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM ShowTime s "
            + "WHERE s.id = :showTimeID";

    TypedQuery<ShowTime> q = em.createQuery(qString, ShowTime.class);
    q.setParameter("showTimeID", showTimeID);

    try {
      ShowTime showTime = q.getSingleResult();
      return showTime;
    } catch (Error | NoResultException e) {
      System.out.println(e);
      return null;
    } finally {
      em.close();
    }
  }


  public static List<ShowTime> selectShowTimes() {
    EntityManager em = DBUtil.getEmFactory().createEntityManager();
    String qString = "SELECT s FROM ShowTime s";
    TypedQuery<ShowTime> q = em.createQuery(qString, ShowTime.class);

    List<ShowTime> showTimes;
    try {
      showTimes = q.getResultList();
      if (showTimes == null || showTimes.isEmpty()) {
        showTimes = null;
      }
    } finally {
      em.close();
    }
    return showTimes;
  }
}
