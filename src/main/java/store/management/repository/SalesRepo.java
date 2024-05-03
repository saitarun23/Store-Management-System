package store.management.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import store.management.model.Sales;
import java.util.Date;


@Repository
public interface SalesRepo extends JpaRepository<Sales, Long>{
	@Query("SELECT s FROM Sales s WHERE DATE(s.saleDate) = :todayDate")
	List<Sales> findBySaleDate(@Param("todayDate") Date saleDate);
	
	@Query("SELECT s FROM Sales s WHERE yearweek(s.saleDate) = yearweek(CURRENT_DATE)")
	List<Sales> findByCurrentWeek();
	
	@Query("SELECT s FROM Sales s WHERE month(s.saleDate) = month(CURRENT_DATE)")
	List<Sales> findByCurrentMonth();
	
	@Query("SELECT s FROM Sales s WHERE month(s.saleDate) > month(CURRENT_DATE) - 3")
	List<Sales> findByQuarterMonth();
	
}