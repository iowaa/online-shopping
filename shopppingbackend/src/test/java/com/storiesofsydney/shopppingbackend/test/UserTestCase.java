package com.storiesofsydney.shopppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.storiesofsydney.shoppingbackend.dao.UserDAO;
import com.storiesofsydney.shoppingbackend.dto.Address;
import com.storiesofsydney.shoppingbackend.dto.Cart;
import com.storiesofsydney.shoppingbackend.dto.User;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Address address = null;
	private Cart cart = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.storiesofsydney.shoppingbackend");
		context.refresh();

		userDAO = (UserDAO) context.getBean("userDAO");
	}

//	@Test
//	public void testAdd() {
//		user = new User();
//		user.setFirstName("Nirpa");
//		user.setLastName("Dani");
//		user.setEmail("g3.nirpa@gmail.com");
//		user.setContactNumber("3242423");
//		user.setRole("USER");
//		user.setPassword("ew23");
//
//		// add the user
//		assertEquals("Failed to add User", true, userDAO.addUser(user));
////
//		address = new Address();
//		address.setAddressLineOne("6 East Street");
//		address.setAddressLineTwo("Granville");
//		address.setCity("Sydney");
//		address.setState("NSW");
//		address.setCountry("Australia");
//		address.setPostalCode("2142");
//		address.setBilling(true);
//
	//	 link the user with the address using user id
//		address.setUserId(user.getId());
//
//		// add the address
//		assertEquals("Failed to add Address", true, userDAO.addAddress(address));
//
//		if (user.getRole().equals("USER")) {
//			// create a cart for this user
//			cart = new Cart();
//			cart.setUser(user);
//			assertEquals("Failed to add Cart", true, userDAO.addCart(cart));
//
//			// add a shipping address for this user
//			address = new Address();
//			address.setAddressLineOne("7 East Street");
//			address.setAddressLineTwo("Granville");
//			address.setCity("Melbourne");
//			address.setState("VIC");
//			address.setCountry("Australia");
//			address.setPostalCode("2193");
//			// setting shipping to true
//			address.setShipping(true);
//
//			// link it with the user
//			address.setUserId(user.getId());
//			assertEquals("Failed to add Shipping Address", true, userDAO.addAddress(address));
//		}
//	}

//	@Test
//	public void testAdd() {
//		user = new User();
//		user.setFirstName("Nirpa");
//		user.setLastName("Dani");
//		user.setEmail("g3.nirpa@gmail.com");
//		user.setContactNumber("3242423");
//		user.setRole("USER");
//		user.setPassword("ew23");
//
//		if (user.getRole().equals("USER")) {
//			// create a cart for this user
//			cart = new Cart();
//			cart.setUser(user);
//
//			// attach cart with the user
//			user.setCart(cart);
//
//		}
//		// add the user
//		assertEquals("Failed to add User", true, userDAO.addUser(user));
//	}

	// not working double check this method
//	@Test
//	public void testUpdateCart() {
//
//		// fetch the user by its email
//		user = userDAO.getByEmail("sp@gmail.com");
//
//		// get the cart of the user
//		cart = user.getCart();
//		
//		cart.setGrandTotal(333);
//		cart.setCartLines(2);
//		assertEquals("Failed to update the cart", true, userDAO.updateCart(cart));
//	}

//	@Test
//	public void testAddAddress() {
//
//		// need to add a user
//		user = new User();
//		user.setFirstName("Nirpa");
//		user.setLastName("Dani");
//		user.setEmail("g3.nirpa@gmail.com");
//		user.setContactNumber("3242423");
//		user.setRole("USER");
//		user.setPassword("ew23");
//
//		// add the user
//		assertEquals("Failed to add User", true, userDAO.addUser(user));
//
//		// going to add address
//		address = new Address();
//		address.setAddressLineOne("6 East Street");
//		address.setAddressLineTwo("Granville");
//		address.setCity("Sydney");
//		address.setState("NSW");
//		address.setCountry("Australia");
//		address.setPostalCode("2142");
//		address.setBilling(true);
//
//		// attach the user to the address
//		address.setUser(user);
//		assertEquals("Failed to add Address", true, userDAO.addAddress(address));
//
//		// adding a shipping address
//		address = new Address();
//		address.setAddressLineOne("7 East Street");
//		address.setAddressLineTwo("Granville");
//		address.setCity("Melbourne");
//		address.setState("VIC");
//		address.setCountry("Australia");
//		address.setPostalCode("2193");
//		// setting shipping to true
//		address.setShipping(true);
//
//		// attach the user to the address
//		address.setUser(user);
//		assertEquals("Failed to add Shipping Address", true, userDAO.addAddress(address));
//
//
//	}

//	@Test
//	public void testAddAddress() {
//
//		user = userDAO.getByEmail("nd@gmail.com");
//
//		address = new Address();
//		address.setAddressLineOne("7 East Street");
//		address.setAddressLineTwo("Granville");
//		address.setCity("Melbourne");
//		address.setState("VIC");
//		address.setCountry("Australia");
//		address.setPostalCode("2193");
//		// setting shipping to true
//		address.setShipping(true);
//
//		// attach the user to the address
//		address.setUser(user);
//		assertEquals("Failed to add Shipping Address", true, userDAO.addAddress(address));
//
//	}

	@Test
	public void testGetAddress() {
		user = userDAO.getByEmail("g3.nirpa@gmail.com");
		assertEquals("Failed to fetch the list of address", 2, userDAO.listShippingAddress(user).size());

		assertEquals("Failed to fetch the billing address", "Sydney", userDAO.getBillingAddress(user).getCity());

	}

}
