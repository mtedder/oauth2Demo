/**
 * 
 */
package com.gc.oauth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Home controller for oauth2 example using github api
 * to get the user's github avatar from their github account.
 * 
 * @author maurice tedder
 *
 */
@Controller
public class HomeController {
	
	/**
	 * This request mapping is for the home page.
	 * @return home.jsp view
	 */
	@RequestMapping("/home")
	public ModelAndView home() {
		
		return new ModelAndView("home");
	}

}
