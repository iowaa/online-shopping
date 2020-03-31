package com.storiesofsydney.shoppingbackend.dao;

import java.util.List;

import com.storiesofsydney.shoppingbackend.dto.Category;


public interface CategoryDAO {
	
	List<Category> list();
	Category get(int id);

}
