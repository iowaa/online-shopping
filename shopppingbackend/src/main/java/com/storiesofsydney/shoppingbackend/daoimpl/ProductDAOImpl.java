package com.storiesofsydney.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.storiesofsydney.shoppingbackend.dao.ProductDAO;
import com.storiesofsydney.shoppingbackend.dto.Product;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	// Get the Product by ID
	@Override
	public Product get(int productId) {
		try {
			return sessionFactory.getCurrentSession().get(Product.class, Integer.valueOf(productId));
		}

		catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}

	@Override
	public List<Product> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Product", Product.class).getResultList();
	}

	// ADD/INSERT new product
	@Override
	public boolean add(Product product) {
		try {
			sessionFactory.getCurrentSession().persist(product);
			return true;
		}

		catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

//Update the Product
	@Override
	public boolean update(Product product) {
		try {
			sessionFactory.getCurrentSession().update(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	// Delete the Product
	@Override
	public boolean delete(Product product) {

		product.setActive(false);

		try {
			sessionFactory.getCurrentSession().update(product);
			return true;
		}

		catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	// Business Methods
	@Override
	public List<Product> listActiveProduts() {
		String selectActiveProducts = "FROM Product WHERE active = :active";
		return sessionFactory.getCurrentSession().createQuery(selectActiveProducts, Product.class)
				.setParameter("active", true).getResultList();
	}

	@Override
	public List<Product> listActiveProductsByCategory(int categoryId) {
		String selectActiveProductsByCategory = "FROM Product WHERE active = :active AND categoryId = :categoryId";
		return sessionFactory.getCurrentSession().createQuery(selectActiveProductsByCategory, Product.class)
				.setParameter("active", true).setParameter("categoryId", categoryId).getResultList();
	}

	@Override
	public List<Product> getLatestActiveProducts(int count) {
		String selectLatestActiveProducts = "FROM Product WHERE active = :active ORDER BY id";
		return sessionFactory.getCurrentSession().createQuery(selectLatestActiveProducts, Product.class)
				.setParameter("active", true).setFirstResult(0).setMaxResults(count).getResultList();
	}

}
