package store.management.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String productName;
	private double sellingPrice;
	private double costPrice;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", sellingPrice=" + sellingPrice + ", costPrice="
				+ costPrice + "]";
	}
	public Product(Long id, String productName, double sellingPrice, double costPrice) {
		super();
		this.id = id;
		this.productName = productName;
		this.sellingPrice = sellingPrice;
		this.costPrice = costPrice;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}