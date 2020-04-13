package com.storiesofsydney.onlineshopping.exception;

public class ProductNotFoundException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String message;

	public ProductNotFoundException() {
		//this("Product is Not Available"); // calling to the default constructor

	}

	public ProductNotFoundException(String message) {
		this.message = System.currentTimeMillis() + ": " + message;
	}

	public String getMessage() {
		return message;
	}

}
