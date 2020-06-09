package com.storiesofsydney.onlineshopping.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storiesofsydney.onlineshopping.model.UserModel;
import com.storiesofsydney.shoppingbackend.dao.CartLineDAO;
import com.storiesofsydney.shoppingbackend.dto.Cart;
import com.storiesofsydney.shoppingbackend.dto.CartLine;
import com.storiesofsydney.shoppingbackend.dto.Product;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDAO cartLineDAO;

	@Autowired
	private HttpSession session;

	// return the cart of the user who has logged in
	private Cart getCart() {
		return ((UserModel) session.getAttribute("userModel")).getCart();
	}

	// return the entire cart line
	public List<CartLine> getCartLines() {
		Cart cart = this.getCart();
		return cartLineDAO.list(cart.getId());
	}

	public String updateCartLine(int cartLineId, int count) {

		// fetch the cartLine
		CartLine cartLine = cartLineDAO.get(cartLineId);
		if (cartLine == null) {
			return "result=error";
		}

		else {
			Product product = cartLine.getProduct();
			double oldTotal = cartLine.getTotal();

			if (product.getQuantity() <= count) {
				count = product.getQuantity();
			}
			cartLine.setProductCount(count);
			cartLine.setBuyingPrice(product.getUnitPrice());
			cartLine.setTotal(product.getUnitPrice() * count);

			cartLineDAO.update(cartLine);

			Cart cart = this.getCart();
			cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartLine.getTotal());

			cartLineDAO.updateCart(cart);

			return "result=updated";
		}

	}

	public String deleteCartLine(int cartLineId) {
		// fetch the cart line
		CartLine cartLine = cartLineDAO.get(cartLineId);
		if (cartLine == null) {
			return "result=error";
		}

		else {

			// update the cart
			Cart cart = this.getCart();
			cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
			cart.setCartLines(cart.getCartLines() - 1);
			cartLineDAO.updateCart(cart);

			// remove the cartLine
			cartLineDAO.delete(cartLine);

			return "result=deleted";
		}
	}

}
