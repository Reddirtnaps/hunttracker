package com.trevor.hunt.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.trevor.hunt.models.User;
import com.trevor.hunt.repositories.UserRepository;
import com.trevor.hunt.services.HuntService;

@Component
public class UserValidators {
	@Autowired
	private UserRepository uRepo;
	@Autowired
	private HuntService hService;
	
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		if(!user.getPassword().equals(user.getConPassword())) {
			errors.rejectValue("conPassword", "Match","Passwords do not match");
		}
		if(this.uRepo.existsByEmail(user.getEmail())) {
			errors.rejectValue("email","unique","Email has already been used");
			
		}
		
	}

}

