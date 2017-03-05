package com.diskservice.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.diskservice.model.Disk;
import com.diskservice.model.Takenitem;
import com.diskservice.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;
	Takenitem takenitem;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addTakenItem(User user, Disk disk) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Takenitem takenitem = new Takenitem(disk, user);
			session.save(takenitem);
		} catch (Exception e) {
			String mes = e.getMessage();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		Session session = sessionFactory.getCurrentSession();
		List<User> users = session.createQuery("from User").list();
		return users;
	}

	

	public Disk findDisk(int id) {
		Session session = sessionFactory.getCurrentSession();
		Disk disk = (Disk) session.createQuery("from Disk where diskId=" + id).uniqueResult();
		return disk;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Disk> listUserDisks(User user) {
		Integer userId = user.getUserId();
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from Disk where user=" + userId).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Disk> listFreeDisks() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from Disk where diskId not in (select disk from Takenitem)").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Takenitem> listTakenUserDisks(User user) {
		String login = user.getLogin();
		Session session = sessionFactory.getCurrentSession();
		return session
				.createQuery("from Takenitem where user.login=?)")
				.setParameter(0, login).list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Takenitem> listGivenUserDisks(User user) {
		String login = user.getLogin();
		Session session = sessionFactory.getCurrentSession();
		List<Takenitem> givenDisks = session.createQuery("from Takenitem where disk.user.login=?").setParameter(0, login).list();
		return givenDisks;
	}

	@Override
	public User findUserLogin(String login) {
		Session session = sessionFactory.getCurrentSession();
		return (User) session.createQuery("from User where userId = (select userId from User where login=?)")
				.setParameter(0, login).uniqueResult();
	}

	@Override
	public Takenitem findTakenItem(Integer diskId) {
		Session session = sessionFactory.getCurrentSession();
		return (Takenitem) session.createQuery("from Takenitem where disk.diskId=" + diskId).uniqueResult();
	}

	@Override
	public void deleteTakenDisk(Integer diskId) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(findTakenItem(diskId));

	}

}
