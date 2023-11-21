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
//import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import org.eclipse.persistence.annotations.UuidGenerator;
import java.sql.Date;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

/**
 *
 * @author Admin
 */
@Entity
public class Invoice implements Serializable {

  @OneToMany(mappedBy = "invoice")
  private List<Ticket> tickets;

  @Id
  @UuidGenerator(name = "UUID")
  @GeneratedValue(generator = "UUID")
  @Column(name = "invoice_id")
  private String invoiceID;

  @ManyToOne
  @JoinColumn(name = "customer_id")
  private Customer customer;

  private Date boughtDate;

  public List<Ticket> getTickets() {
    return tickets;
  }

  public void setTickets(List<Ticket> tickets) {
    this.tickets = tickets;
  }

  public Customer getCustomer() {
    return customer;
  }

  public void setCustomer(Customer customer) {
    this.customer = customer;
  }

  public String getInvoiceID() {
    return invoiceID;
  }

  public void setInvoiceID(String invoiceID) {
    this.invoiceID = invoiceID;
  }

  public Date getBoughDate() {
    return boughtDate;
  }

  public void setBoughDate(Date boughDate) {
    this.boughtDate = boughDate;
  }

}
