package com.socialsearcher.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.socialsearcher.model.SocialPerson;
import com.socialsearcher.model.SocialPersonGroup;
import com.socialsearcher.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;
	SocialPersonGroup socialPersonGroup;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addSocialPersonGroup(User user, SocialPerson socialPerson) {
		/*
		try {
			Session session = sessionFactory.getCurrentSession();
			SocialPersonGroup socialPersonGroup = new SocialPersonGroup(socialPerson, user);
			session.save(socialPersonGroup);
		} catch (Exception e) {
			String mes = e.getMessage();
		}
		*/
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		Session session = sessionFactory.getCurrentSession();
		List<User> users = session.createQuery("from User").list();
		return users;
	}

	

	public SocialPerson findSocialPerson(int id) {
		Session session = sessionFactory.getCurrentSession();
		SocialPerson disk = (SocialPerson) session.createQuery("from SocialPerson where diskId=" + id).uniqueResult();
		return disk;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SocialPerson> listUserDisks(User user) {
		Integer userId = user.getUserId();
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from SocialPerson where user=" + userId).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SocialPerson> listFreeDisks() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from SocialPerson where id not in (select disk from SocialPersonGroup)").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SocialPersonGroup> listTakenUserDisks(User user) {
		String login = user.getLogin();
		Session session = sessionFactory.getCurrentSession();
		return session
				.createQuery("from Takenitem where user.login=?)")
				.setParameter(0, login).list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SocialPersonGroup> listGivenUserDisks(User user) {
		String login = user.getLogin();
		Session session = sessionFactory.getCurrentSession();
		List<SocialPersonGroup> givenDisks = session.createQuery("from Takenitem where disk.user.login=?").setParameter(0, login).list();
		return givenDisks;
	}

	@Override
	public User findUserLogin(String login) {
		Session session = sessionFactory.getCurrentSession();
		return (User) session.createQuery("from User where userId = (select userId from User where login=?)")
				.setParameter(0, login).uniqueResult();
	}

	@Override
	public SocialPersonGroup findSocialPersonGroup(Integer diskId) {
		Session session = sessionFactory.getCurrentSession();
		return (SocialPersonGroup) session.createQuery("from SocialPersonGroup where disk.diskId=" + diskId).uniqueResult();
	}

	@Override
	public void deleteSocialPersonGroup(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(findSocialPersonGroup(id));

	}

}
