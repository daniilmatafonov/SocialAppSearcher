package com.socialsearcher.services;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.socialsearcher.dao.UserDao;
import com.socialsearcher.model.SocialPerson;
import com.socialsearcher.model.SocialPersonGroup;
import com.socialsearcher.model.User;

@Service
public class UserServiceImpl implements UserService {

	private UserDao userDAO;

	@Transactional
	@Override
	public void addSocialPersonGroup(User user, SocialPerson socialPerson) {
		userDAO.addSocialPersonGroup(user, socialPerson);

	}

	public UserDao getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDao userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	@Transactional
	public List<User> listUsers() {
		return userDAO.listUsers();
	}


	@Override
	@Transactional
	public SocialPerson findDisk(int id) {
		return userDAO.findSocialPerson(id);
	}

	@Override
	@Transactional
	public List<SocialPerson> listUserDisks() {
		return userDAO.listUserDisks(findCurrentUser());
	}

	@Override
	@Transactional
	public List<SocialPerson> listFreeDisks() {
		return userDAO.listFreeDisks();
	}

	@Override
	@Transactional
	public List<SocialPersonGroup> listTakenUserDisks() {
		return userDAO.listTakenUserDisks(findCurrentUser());
	}

	@Override
	@Transactional
	public List<SocialPersonGroup> listGivenUserDisks() {
		return userDAO.listGivenUserDisks(findCurrentUser());
	}

	@Override
	@Transactional
	public User findCurrentUser() {

		String userLogin = null;
		Object objPrincipal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (objPrincipal instanceof UserDetails) {
			userLogin = String.valueOf(((UserDetails) objPrincipal).getUsername());
		} else {
			userLogin = String.valueOf(objPrincipal);
		}

		return userDAO.findUserLogin(userLogin);
	}

	@Override
	@Transactional
	public SocialPersonGroup findSocialPersonGroup(Integer id) {
		return userDAO.findSocialPersonGroup(id);
	}

	@Override
	@Transactional
	public void deleteSocialPersonGroup(Integer id) {
		userDAO.deleteSocialPersonGroup(id);

	}

}
