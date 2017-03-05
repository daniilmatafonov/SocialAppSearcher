package com.diskservice.services;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.diskservice.model.Disk;
import com.diskservice.model.Takenitem;
import com.diskservice.model.User;

public interface UserService {
	void addTakenItem(User user, Disk disk);
	List<User> listUsers();
	Disk findDisk(int id);
	List<Disk> listUserDisks();
	List<Takenitem> listTakenUserDisks();
	List<Takenitem> listGivenUserDisks();
	User findCurrentUser();
	List<Disk> listFreeDisks();
	Takenitem findTakenItem(Integer diskId);
	void deleteTakenDisk(Integer diskId);
	

}
