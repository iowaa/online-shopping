package com.storiesofsydney.shoppingbackend.dao;

import java.util.List;

import com.storiesofsydney.shoppingbackend.dto.Category;

public interface CategoryDAO {

	Category get(int id);

	boolean add(Category category);

	List<Category> list();

	boolean update(Category category);

	boolean delete(Category category);
}
