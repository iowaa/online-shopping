package com.storiesofsydney.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.storiesofsydney.shoppingbackend.dto.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Product product = (Product) target;

		// whether file has been selected

		if (product.getFile() == null || product.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Please select an image file to upload");
			return;
		}

		if ((!product.getFile().getContentType().contentEquals("image/jpeg"))
				|| (!product.getFile().getContentType().contentEquals("image/jpg"))
				|| (!product.getFile().getContentType().contentEquals("image/png"))
				|| (!product.getFile().getContentType().contentEquals("image/gif"))) {

		}
		errors.rejectValue("file", null, "Please select a valid Image File");
		return;
	}

}
