package com.chegus.mvcInternationalization.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController
{
	@GetMapping({"/","/userForm"})
	public String home() {
		
		return "userForm";
	}
}
