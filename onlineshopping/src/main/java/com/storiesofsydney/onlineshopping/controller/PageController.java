package com.storiesofsydney.onlineshopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		return mv;
	}

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact Us");
		mv.addObject("userClickContact", true);
		return mv;
	}

	@RequestMapping(value = "/listProducts")
	public ModelAndView listProducts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "listProducts");
		mv.addObject("userClicklistProducts", true);
		return mv;
	}
	
	@RequestMapping(value = "/career")
	public ModelAndView career() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Career");
		mv.addObject("userClickCareer", true);
		return mv;
	}

}
