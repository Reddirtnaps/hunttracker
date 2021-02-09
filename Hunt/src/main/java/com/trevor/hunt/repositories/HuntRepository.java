package com.trevor.hunt.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.trevor.hunt.models.Hunt;
import com.trevor.hunt.models.User;

import net.bytebuddy.asm.Advice.OffsetMapping.Sort;
@Repository
public interface HuntRepository extends CrudRepository<Hunt,Long> {
	List<Hunt> findAll();
	List<Hunt> findByAnimalContainsAndHunter(String animal, User user);
	List<Hunt> findBySuccessContainsAndHunter(String success, User user);
	List<Hunt> findByAnimalContainsAndSuccessContainsAndHunter(String animal, String success, User user);
}
