package store.management.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import store.management.model.Product;

@Repository
public interface ProductRepo extends JpaRepository<Product, Long>{
	
	
}
