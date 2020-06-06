package com.storiesofsydney.shoppingbackend.dao;

import java.util.List;

import com.storiesofsydney.shoppingbackend.dto.Address;
import com.storiesofsydney.shoppingbackend.dto.User;

public interface UserDAO {

	// add a user
	boolean addUser(User user);
	User getByEmail(String email);

	// add a address
	boolean addAddress(Address address);
	Address getBillingAddress(User user);
	List<Address> listShippingAddress(User user);

	// update a cart
//	boolean updateCart(Cart cart);

}
