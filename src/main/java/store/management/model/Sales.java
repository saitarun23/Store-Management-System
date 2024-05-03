package store.management.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Sales {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String itemName;
	private double sellingPrice;
	private double costPrice;
	private Date saleDate;
	private String customerName;
	private String phNo;
	private int quantity;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public double getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public double getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}

	public Date getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPhNo() {
		return phNo;
	}

	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Sales [id=" + id + ", itemName=" + itemName + ", sellingPrice=" + sellingPrice + ", costPrice="
				+ costPrice + ", saleDate=" + saleDate + ", customerName=" + customerName + ", phNo=" + phNo
				+ ", quantity=" + quantity + "]";
	}

	public Sales(Long id, String itemName, double sellingPrice, double costPrice, Date saleDate, String customerName,
			String phNo, int quantity) {
		super();
		this.id = id;
		this.itemName = itemName;
		this.sellingPrice = sellingPrice;
		this.costPrice = costPrice;
		this.saleDate = saleDate;
		this.customerName = customerName;
		this.phNo = phNo;
		this.quantity = quantity;
	}

	public Sales() {
		super();
		// TODO Auto-generated constructor stub
	}
}