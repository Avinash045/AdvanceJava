package com.employee.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.employee.entity.Hotel;

@Repository
public interface HotelRepo extends JpaRepository<Hotel ,Long>{

	

	
	

	

}
