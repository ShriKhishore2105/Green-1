package com.example.project.repositories;

import com.example.project.model.Payment;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
	Optional<Payment> findTopByOrderByOrderIdDesc();
	Optional<Payment> findByOrderId(Long orderId);
}

