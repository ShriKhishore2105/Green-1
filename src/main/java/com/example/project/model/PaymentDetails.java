package com.example.project.model;

public class PaymentDetails {
	
	private Payment payment;
	private CustomerDetails customerDetails;

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public CustomerDetails getCustomerDetails() {
		return customerDetails;
	}

	public void setCustomerDetails(CustomerDetails customerDetails) {
		this.customerDetails = customerDetails;
	}

	@Override
	public String toString() {
		return "PaymentDetails [payment=" + payment + ", customerDetails=" + customerDetails + "]";
	}
	
	
}
