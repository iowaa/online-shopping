package com.storiesofsydney.onlineshopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.storiesofsydney.shoppingbackend.dao.CategoryDAO;
import com.storiesofsydney.shoppingbackend.dao.ProductDAO;
import com.storiesofsydney.shoppingbackend.dto.Category;
import com.storiesofsydney.shoppingbackend.dto.Product;
import com.storiesofsydney.util.FileUploadUtility;
import com.storiesofsydney.validator.ProductValidator;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProductDAO productDAO;

	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("UserClickManageProducts", true);
		mv.addObject("title", "Manage Products");

		Product newProduct = new Product();
		// setting few of the fields
		newProduct.setSupplierId(1);
		newProduct.setActive(true);
		mv.addObject("product", newProduct);

		if (operation != null) {
			if (operation.equals("product")) {
				mv.addObject("message", "Product Addedd Successfully!");
			}

			else if (operation.equals("category")) {
				mv.addObject("message", "Category Added Successfully");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/{id}/product", method = RequestMethod.GET)
	public ModelAndView showEditProducts(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("UserClickManageProducts", true);
		mv.addObject("title", "Manage Products");

		// fetch the product form the database

		Product newProduct = productDAO.get(id);

		// set the product fetched from database

		mv.addObject("product", newProduct);

		return mv;
	}

	// handling product submission
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product modifiedProduct,
			BindingResult results, Model model, HttpServletRequest request) {

		// handle the image validation for new products
		if (modifiedProduct.getId() == 0) {
			new ProductValidator().validate(modifiedProduct, results);
		}

		else {
			if (!modifiedProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(modifiedProduct, results);

			}
		}
		// Check if there are any errors
		if (results.hasErrors()) {
			model.addAttribute("UserClickManageProducts", true);
			model.addAttribute("title", "Manage Products");
			model.addAttribute("message", "Validation Failed for Product Submission!");
			return "page";
		}

		logger.info(modifiedProduct.toString());

		if (modifiedProduct.getId() == 0) {
			// create a new product record if the id is 0
			productDAO.add(modifiedProduct);
		} else {
			// update the product if the id is not 0
			productDAO.update(modifiedProduct);
		}

		if (!modifiedProduct.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request, modifiedProduct.getFile(), modifiedProduct.getCode());
		}

		return "redirect:/manage/products?operation=product";
	}

	@RequestMapping(value = "/product/{id}/activation", method = RequestMethod.POST)
	@ResponseBody
	public String handleProductActivation(@PathVariable int id) {

		// is going to fetch the product from the database
		Product product = productDAO.get(id);
		boolean isActive = product.isActive();

		// Activating and Deactivating based on the value of active field
		product.setActive(!product.isActive());

		// updating the product
		productDAO.update(product);

		return (isActive) ? "You have successfully deactivated the  " + product.getName()
				: "You have successfully activated the " + product.getName();
	}

	// to handle category submission
	@RequestMapping(value = "/category", method = RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category category) {
		// add the new Category
		categoryDAO.add(category);
		return "redirect:/manage/products?operation=category";
	}

	// returning categories for all the request mapping
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categoryDAO.list();
	}

	@ModelAttribute("category")
	public Category getCategory() {
		return new Category();
	}

}
