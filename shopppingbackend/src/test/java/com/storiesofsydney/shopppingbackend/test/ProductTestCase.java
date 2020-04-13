package com.storiesofsydney.shopppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.storiesofsydney.shoppingbackend.dao.ProductDAO;
import com.storiesofsydney.shoppingbackend.dto.Product;

public class ProductTestCase {

	private static AnnotationConfigApplicationContext context;

	private static ProductDAO productDAO;

	private Product product;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.storiesofsydney.shoppingbackend");
		context.refresh();

		productDAO = (ProductDAO) context.getBean("productDAO");
	}

//	@Test
//	public void testCRUDCategory() {
//
//		product = new Product();
//		product.setName("OPPO S2");
//		product.setBrand("Oppo");
//		product.setDescription("This is OPPO");
//		product.setUnitPrice(12333);
//		product.setActive(true);
//		product.setCategoryId(3);
//		product.setSupplierId(3);
//
//		assertEquals("Something went wrong while adding the item", true, productDAO.add(product));
//
//		// Feching and updating the category
//		product = productDAO.get(3);
//		product.setName("Google Pixel 4");
//		assertEquals("SSomething went wrong while updating the item", true, productDAO.update(product));
//
//		// Deleting the category
//		assertEquals("Something went wrong while deleting the item", true, productDAO.delete(product));
//
//		// Fetching the List
//		assertEquals("Something went wrong while fetching the item", 6, productDAO.list().size());
//
//	}

	@Test
	public void testListActiveProducts() {
		assertEquals("Something went wrong while listing the active Products", 5,
				productDAO.listActiveProduts().size());
	}

	@Test
	public void testListActiveProductsByCategory() {
		assertEquals("Something went wrong while listing the active Products by Category", 3,
				productDAO.listActiveProductsByCategory(3).size());
		assertEquals("Something went wrong while listing the active Products by Category", 2,
				productDAO.listActiveProductsByCategory(1).size());
	}

	@Test
	public void testLatestActiveProducts() {
		assertEquals("Something went wrong while listing the active Products by Category", 3,
				productDAO.getLatestActiveProducts(3).size());

	}
}
