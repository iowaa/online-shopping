package com.storiesofsydney.onlineshopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("greeting", "Hello From the Other Side");
		return mv;
	}

//	@RequestMapping(value = "/test")
//	public ModelAndView test(@RequestParam(value = "greeting", required = false) String greeting) {
//
//		if (greeting == null) {
//			greeting = "Ok";
//		}
//		ModelAndView mv = new ModelAndView("page");
//		mv.addObject("greeting", greeting);
//		return mv;
//	}

	@RequestMapping(value = "/test/{greeting}") // {} means that the value is dynamic
	public ModelAndView test(@PathVariable(value = "greeting", required = false) String greeting) {

		if (greeting == null) {
			greeting = "Ok";
		}
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("greeting", greeting);
		return mv;
	}
}
