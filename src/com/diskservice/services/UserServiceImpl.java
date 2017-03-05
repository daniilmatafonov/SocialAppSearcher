package com.diskservice.services;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diskservice.dao.UserDao;
import com.diskservice.model.Disk;
import com.diskservice.model.Takenitem;
import com.diskservice.model.User;

@Service
public class UserServiceImpl implements UserService {

	private UserDao userDAO;

	@Transactional
	@Override
	public void addTakenItem(User user, Disk disk) {
		userDAO.addTakenItem(user, disk);

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
	public Disk findDisk(int id) {
		return userDAO.findDisk(id);
	}

	@Override
	@Transactional
	public List<Disk> listUserDisks() {
		return userDAO.listUserDisks(findCurrentUser());
	}

	@Override
	@Transactional
	public List<Disk> listFreeDisks() {
		return userDAO.listFreeDisks();
	}

	@Override
	@Transactional
	public List<Takenitem> listTakenUserDisks() {
		return userDAO.listTakenUserDisks(findCurrentUser());
	}

	@Override
	@Transactional
	public List<Takenitem> listGivenUserDisks() {
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
	public Takenitem findTakenItem(Integer diskId) {
		return userDAO.findTakenItem(diskId);
	}

	@Override
	@Transactional
	public void deleteTakenDisk(Integer diskId) {
		userDAO.deleteTakenDisk(diskId);

	}

}
