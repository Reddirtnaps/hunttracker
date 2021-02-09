package com.trevor.hunt.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trevor.hunt.models.User;
import com.trevor.hunt.services.UserService;
import com.trevor.hunt.validators.UserValidators;

@Controller
public class UserController {
	@Autowired
	private UserService uService;
	@Autowired
	private UserValidators validator;
	
	@GetMapping("/")
	public String index(@ModelAttribute("user")User user) {
		return "index.jsp";
	}
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user")User user, BindingResult result, HttpSession session) {
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		User newUser = this.uService.registerUser(user);
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/dashboard";
	}
	@GetMapping("/welcome")
	public String welcome(@ModelAttribute("user")User user) {
		return "login.jsp";
	}
	@PostMapping("/login")
	public String login(@RequestParam("theEmail")String email, @RequestParam("thePassword")String password, RedirectAttributes redirectAtt, HttpSession session) {
		if(!this.uService.authenticateUser(email, password)) {
			redirectAtt.addFlashAttribute("loginError","<div class=\"alert alert-danger\">\n"
					+ "  <strong>Warning!</strong> Email or Password is invalid\n"
					+ "</div>");
			return "redirect:/welcome";
		}
		User user = this.uService.getByEmail(email);
		session.setAttribute("user_id", user.getId());
		return "redirect:/dashboard";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/welcome";
	}
}
