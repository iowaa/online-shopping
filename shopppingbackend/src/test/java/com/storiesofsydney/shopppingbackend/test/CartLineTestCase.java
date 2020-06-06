package com.storiesofsydney.shopppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.storiesofsydney.shoppingbackend.dao.CartLineDAO;
import com.storiesofsydney.shoppingbackend.dao.ProductDAO;
import com.storiesofsydney.shoppingbackend.dao.UserDAO;
import com.storiesofsydney.shoppingbackend.dto.Cart;
import com.storiesofsydney.shoppingbackend.dto.CartLine;
import com.storiesofsydney.shoppingbackend.dto.Product;
import com.storiesofsydney.shoppingbackend.dto.User;

public class CartLineTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CartLineDAO cartLineDAO = null;
	private static ProductDAO productDAO = null;
	private static UserDAO userDAO;

	private Product product = null;
	private User user = null;
	private Cart cart = null;
	private CartLine cartLine = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.storiesofsydney.shoppingbackend");
		context.refresh();

		productDAO = (ProductDAO) context.getBean("productDAO");
		userDAO = (UserDAO) context.getBean("userDAO");
		cartLineDAO = (CartLineDAO) context.getBean("cartLineDAO");
	}

	@Test
	public void testAddNewCartLine() {

		// get the user
		user = userDAO.getByEmail("sami@gmail.com");

		// fetch the cart
		cart = user.getCart();

		// get the product
		product = productDAO.get(1);

		// create a new cartline
		cartLine = new CartLine();
		cartLine.setBuyingPrice(product.getUnitPrice());

		cartLine.setProductCount(cartLine.getProductCount() + 1);
		cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice());

		cartLine.setAvailable(true);

		cartLine.setCartId(cart.getId());

		cartLine.setProduct(product);

		assertEquals("Failed to add the cartLie", true, cartLineDAO.add(cartLine));

		// update the cart
		cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
		cart.setCartLines(cart.getCartLines() + 1);

		assertEquals("Failed to update the cart", true, cartLineDAO.updateCart(cart));

	}
}