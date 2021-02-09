package com.trevor.hunt.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trevor.hunt.models.Hunt;
import com.trevor.hunt.models.User;
import com.trevor.hunt.services.HuntService;
import com.trevor.hunt.services.UserService;
import com.trevor.hunt.validators.UserValidators;

@Controller
public class HuntController {
	@Autowired
	private HuntService hService;
	@Autowired
	private UserService uService;
	@Autowired
	private UserValidators uValidate;
	
	@GetMapping("/dashboard")
		public String dashbord(Model model, HttpSession session) {
			Long userId= (Long)session.getAttribute("user_id");
			model.addAttribute("user", this.uService.getOneUser(userId));
			return "dashboard.jsp";
		}
	@PostMapping("/dashboard")
		public String sortDashboard(@RequestParam("animal")String animal,@RequestParam("success")String success ,Model model,HttpSession session) {
			Long userId= (Long)session.getAttribute("user_id");

			if(animal!="" && success=="") {
				model.addAttribute("user", this.uService.sortAnimal(animal, userId));
				return "dashboard.jsp";
			}
			if (success!="" && animal=="") {
				model.addAttribute("user", this.uService.sortSuccess(success, userId));
				return "dashboard.jsp";
			}
			model.addAttribute("user", this.uService.sortAnimalSuccess(animal, success, userId));
			return "dashboard.jsp";

	}
	@GetMapping("/location")
		public String location() {
			return "location.jsp";
	}
	@GetMapping("/weather")
		public String weather(Model model) {
		model.addAttribute("weather",this.hService.degToDir(this.hService.geoWeather(this.hService.location())));
			return "weather.jsp";
	}
	@PostMapping("/weather")
		public String getWeather(@RequestParam("city")String city,Model model,RedirectAttributes redirectAtt) {
			model.addAttribute("weather",this.hService.degToDir(this.hService.getWeather(city)));
			return "weather.jsp";
	}
	@GetMapping("/new")
		public String newHunt(@ModelAttribute("hunt") Hunt hunt,HttpSession session) {
			return "new.jsp";
	}
	@PostMapping("/new")
		public String saveHunt(@Valid @ModelAttribute("hunt")Hunt hunt, BindingResult result,HttpSession session) {
		if(result.hasErrors()) {
			return "new.jsp";
		}
			Long userId = (Long)session.getAttribute("user_id");
			User userHunt = this.uService.getOneUser(userId);
			hunt.setHunter(userHunt);
			this.hService.createHunt(hunt);
			return "redirect:/dashboard";
	}
	@GetMapping("/autofill/new")
		public String autofillNew(@ModelAttribute("hunt")Hunt hunt,Model model) {
			model.addAttribute("weather",this.hService.degToDir(this.hService.geoWeather(this.hService.location())));
			return "autofillNew.jsp";
	}
	
	@PostMapping("/autofill")
		public String autofillSave(@Valid @ModelAttribute("hunt")Hunt hunt,BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "autofillNew.jsp";
		}
		Long userId = (Long)session.getAttribute("user_id");
		User userHunt = this.uService.getOneUser(userId);
		hunt.setHunter(userHunt);
		this.hService.createHunt(hunt);
		return "redirect:/dashboard";
	}
	@GetMapping("/delete/{id}")
		public String delete(@PathVariable("id")Long id) {
		this.hService.deleteHunt(id);
		return "redirect:/dashboard";
	}
	@GetMapping("/hunt/{id}")
		public String view(@PathVariable("id")Long id, Model model) {
		model.addAttribute("hunt",this.hService.findHunt(id));
		return "view.jsp";
	}
	

}
