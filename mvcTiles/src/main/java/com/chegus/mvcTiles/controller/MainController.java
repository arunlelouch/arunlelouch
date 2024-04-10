package com.chegus.mvcTiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/home")
	public String home()
	{
		return "home";
	}
	
	@RequestMapping("/contact")
	public String contact()
	{
		return "contact";
	}
	
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
}
