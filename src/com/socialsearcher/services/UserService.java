package com.socialsearcher.services;

import java.util.List;
import com.socialsearcher.model.SocialPerson;
import com.socialsearcher.model.SocialPersonGroup;
import com.socialsearcher.model.User;

public interface UserService {
	void addSocialPersonGroup(User user, SocialPerson socialPerson);
	List<User> listUsers();
	SocialPerson findDisk(int id);
	List<SocialPerson> listUserDisks();
	List<SocialPersonGroup> listTakenUserDisks();
	List<SocialPersonGroup> listGivenUserDisks();
	User findCurrentUser();
	List<SocialPerson> listFreeDisks();
	SocialPersonGroup findSocialPersonGroup(Integer id);
	void deleteSocialPersonGroup(Integer id);
	

}
