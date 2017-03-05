package com.socialsearcher.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import com.socialsearcher.model.SocialPerson;
import com.socialsearcher.model.SocialPersonGroup;
import com.socialsearcher.model.User;

public interface UserDao {
	public List<User> listUsers();
	public SocialPerson findSocialPerson(int id);
	public List<SocialPerson> listUserDisks(User user);
	public List<SocialPersonGroup> listTakenUserDisks(User user);
	public List<SocialPersonGroup> listGivenUserDisks(User user);
	public User findUserLogin(String login);
	public List<SocialPerson> listFreeDisks();
	public void addSocialPersonGroup(User user, SocialPerson socialPerson);
	public SocialPersonGroup findSocialPersonGroup(Integer id);
	public void deleteSocialPersonGroup(Integer id);
	

}
