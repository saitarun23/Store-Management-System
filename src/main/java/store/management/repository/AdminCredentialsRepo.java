package store.management.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import store.management.model.AdminCredentials;



@Repository
public interface AdminCredentialsRepo extends JpaRepository<AdminCredentials, String>{
		AdminCredentials  findByAdminId(String adminId);
}
