package com.journaldev.spring.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Challenge;

@Repository
public class ChallengeDAOImpl implements ChallengeDAO{
	
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}


	@Override
	public void addChallenge(Challenge challenge) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(challenge);
		
		
	}

	@Override
	public Challenge getChallenge(int challengeID) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		Challenge challenge = (Challenge) session.createQuery("from Challenge where challengeID=" + challengeID).list().get(0);
		return challenge;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Challenge> getAllChallenege(int challengeStatus) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		
		List<Challenge> listChallenge = session.createQuery("from Challenge where challengeStatus="+challengeStatus).list();
		return listChallenge;
	}


	@Override
	@SuppressWarnings("unchecked")
	public List<Challenge> getOpenChallenges(int points) {
		// TODO Auto-generated method stub
		List<Challenge> listChallenge;
		Session session = this.sessionFactory.getCurrentSession();
		if(points<199){
		listChallenge = session.createQuery("from Challenge where challengeStatus=0 and points between 5 and 30").list();
		}
		else if(points>199 & points<499){
			listChallenge = session.createQuery("from Challenge where challengeStatus=0 and points between 31 and 100").list();
		}
		else{
			listChallenge = session.createQuery("from Challenge where challengeStatus=0 and points between 101 and 150").list();
		}
		return listChallenge;
	}

}
