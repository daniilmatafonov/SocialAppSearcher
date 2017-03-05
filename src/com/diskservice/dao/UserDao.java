package com.diskservice.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.diskservice.model.Disk;
import com.diskservice.model.Takenitem;
import com.diskservice.model.User;

public interface UserDao {
	public List<User> listUsers();
	public Disk findDisk(int id);
	public List<Disk> listUserDisks(User user);
	public List<Takenitem> listTakenUserDisks(User user);
	public List<Takenitem> listGivenUserDisks(User user);
	public User findUserLogin(String login);
	public List<Disk> listFreeDisks();
	public void addTakenItem(User user, Disk disk);
	public Takenitem findTakenItem(Integer diskId);
	public void deleteTakenDisk(Integer diskId);
	

}
