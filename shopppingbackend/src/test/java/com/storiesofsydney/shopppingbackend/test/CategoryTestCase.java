package com.storiesofsydney.shopppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.storiesofsydney.shoppingbackend.dao.CategoryDAO;
import com.storiesofsydney.shoppingbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CategoryDAO categoryDAO;

	private Category category;

	@BeforeClass
	public static void init() {

		context = new AnnotationConfigApplicationContext();
		context.scan("com.storiesofsydney.shoppingbackend");
		context.refresh();

		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}

//	@Test
//	public void testAddCategory() {
//		category = new Category();
//
//		category.setName("Television");
//		category.setDescription("This is  the Television");
//		category.setImageURL("Television_123");
//
//		assertEquals("Sucessfully added to the list", true, categoryDAO.add(category));
//
//	}
//
//	@Test
//	public void testGetCategory() {
//		category = categoryDAO.get(3);
//		assertEquals("Sucessfully fetched the third item", "Television", category.getName());
//	}

//	@Test
//	public void testUpdateCategory() {
//		category = categoryDAO.get(3);
//		category.setName("TV");
//		assertEquals("Sucessfully updated the item", true, categoryDAO.update(category));
//	}

//	@Test
//	public void testdeleteCategory() {
//		category = categoryDAO.get(3);
//		assertEquals("Sucessfully deleted the item", true, categoryDAO.delete(category));
//	}

//	@Test
//	public void testListCategory() {
//		category = categoryDAO.get(3);
//		assertEquals("Sucessfully fetched the list of category from the table", 2, categoryDAO.list().size());
//	}

	@Test
	public void testCRUDCategory() {

		category = new Category();
		category.setName("Television");
		category.setDescription("This is  the Television");
		category.setImageURL("Television_123");
		assertEquals("Sucessfully added to the list", true, categoryDAO.add(category));

		category = new Category();
		category.setName("Laptop");
		category.setDescription("This is  the Laptop");
		category.setImageURL("Laptop_123");
		assertEquals("Sucessfully added to the list", true, categoryDAO.add(category));


		// Feching and updating the category
		category = categoryDAO.get(3);
		category.setName("SmartPhone");
		assertEquals("Sucessfully fetched the third item", true, categoryDAO.update(category));

		// Deleting the category
		assertEquals("Sucessfully deleted the item", true, categoryDAO.delete(category));

		// Fetching the List
		assertEquals("Sucessfully fetched the item", 12, categoryDAO.list().size());

	}

}
