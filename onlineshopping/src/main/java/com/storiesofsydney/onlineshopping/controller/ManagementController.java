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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	private CategoryDAO categeroyDAO;

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
		}

		return mv;
	}

	// handling product submission
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product modifiedProduct,
			BindingResult results, Model model, HttpServletRequest request) {
		
		new ProductValidator().validate(modifiedProduct, results);

		// Check if there are any errors
		if (results.hasErrors()) {
			model.addAttribute("UserClickManageProducts", true);
			model.addAttribute("title", "Manage Products");
			model.addAttribute("message", "Validation Failed for Product Submission!");
			return "page";
		}

		logger.info(modifiedProduct.toString());
		// create a new product record
		productDAO.add(modifiedProduct);

		if (!modifiedProduct.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request, modifiedProduct.getFile(), modifiedProduct.getCode());
		}

		return "redirect:/manage/products?operation=product";
	}

	// returning categories for all the request mapping
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categeroyDAO.list();
	}
}
