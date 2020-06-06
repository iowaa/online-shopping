package com.storiesofsydney.shoppingbackend.dao;

import java.util.List;

import com.storiesofsydney.shoppingbackend.dto.Cart;
import com.storiesofsydney.shoppingbackend.dto.CartLine;

public interface CartLineDAO {

	public CartLine get(int id);

	public boolean add(CartLine cartLine);

	public boolean update(CartLine cartLine);

	public boolean delete(CartLine cartLine);

	public List<CartLine> list(int cartId);

	// business method

	public List<CartLine> listAvailable(int cartId);

	public CartLine getByCartAndProduct(int cartId, int productId);
	
	//update a cart
	boolean updateCart(Cart cart);


}
