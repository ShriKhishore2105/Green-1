package com.example.project.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "pay_account")
public class PayAccount {

    @Id
    private int id;

    private String cardNumber;

    private String cvv;

    private Double balance;

    public PayAccount() {}

    public PayAccount(String cardNumber, String cvv, Double balance) {
        this.cardNumber = cardNumber;
        this.cvv = cvv;
        this.balance = balance;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }
}
