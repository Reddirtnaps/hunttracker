package com.trevor.hunt.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trevor.hunt.models.Hunt;
import com.trevor.hunt.models.User;
import com.trevor.hunt.repositories.HuntRepository;
import com.trevor.hunt.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
		private UserRepository uRepo;
	@Autowired
		private HuntRepository hRepo;
	
		public User registerUser(User user) {
			String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
			user.setPassword(hash);
			return this.uRepo.save(user);
		}
		
		public boolean authenticateUser(String email, String password) {
			User user = this.uRepo.findByEmail(email);
			if(user == null) {
				return false;
			}
			return BCrypt.checkpw(password, user.getPassword());
		}
		public User getByEmail(String email) {
			return this.uRepo.findByEmail(email);
		}
		public User getOneUser(Long id) {
			return this.uRepo.findById(id).orElse(null);
		}
		public User sortAnimal(String animal,Long id) {
			User newUser = this.uRepo.findById(id).orElse(null);
			newUser.setHunts(this.hRepo.findByAnimalContainsAndHunter(animal, newUser));
			return newUser;
		}
		public User sortSuccess(String success,Long id) {
			User newUser = this.uRepo.findById(id).orElse(null);
			newUser.setHunts(this.hRepo.findBySuccessContainsAndHunter(success, newUser));
			return newUser;
		}
		public User sortAnimalSuccess(String animal, String success, Long id) {
			User newUser = this.uRepo.findById(id).orElse(null);
			newUser.setHunts(this.hRepo.findByAnimalContainsAndSuccessContainsAndHunter(animal, success, newUser));
			return newUser;
		}
	}
