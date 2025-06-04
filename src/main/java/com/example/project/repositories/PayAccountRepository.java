package com.example.project.repositories;

import com.example.project.model.PayAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PayAccountRepository extends JpaRepository<PayAccount, Long> {

    // Original method
    Optional<PayAccount> findByCardNumberAndCvv(String cardNumber, String cvv);

    // Debug methods to help troubleshoot
    List<PayAccount> findByCardNumber(String cardNumber);

    List<PayAccount> findByCvv(String cvv);

    // Case-insensitive search (if needed)
    @Query("SELECT p FROM PayAccount p WHERE UPPER(p.cardNumber) = UPPER(:cardNumber) AND UPPER(p.cvv) = UPPER(:cvv)")
    Optional<PayAccount> findByCardNumberIgnoreCaseAndCvvIgnoreCase(@Param("cardNumber") String cardNumber, @Param("cvv") String cvv);

    // Custom query with exact match (in case Spring Data JPA has issues)
    @Query("SELECT p FROM PayAccount p WHERE p.cardNumber = :cardNumber AND p.cvv = :cvv")
    Optional<PayAccount> findByCardNumberAndCvvExact(@Param("cardNumber") String cardNumber, @Param("cvv") String cvv);

    // Query to check if any records exist
    @Query("SELECT COUNT(p) FROM PayAccount p")
    long countAllPayAccounts();

    // Query to find all records for debugging
    @Query("SELECT p FROM PayAccount p")
    List<PayAccount> findAllPayAccounts();
}