package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import model.entity.Question;
import model.entity.QuizResult;
import model.utility.HibernateUtil;

public class QuizDao {
	
	EntityManager em;
	
	public QuizDao() {
		em = HibernateUtil.getFactroy().createEntityManager();
	}
	
	public List<Question> getQuestionsBySubject(String subject) {
        List<Question> list = new ArrayList<>();
        try {
            // JPQL doesn't support "ORDER BY RAND()" easily across all DBs.
            // So we just fetch all and shuffle, OR fetch first 5 for simplicity.
            String jpql = "SELECT q FROM Question q WHERE q.subject = :sub";
            TypedQuery<Question> q = em.createQuery(jpql, Question.class);
            q.setParameter("sub", subject);
            q.setMaxResults(5); // Only fetch 5 questions for the quiz
            
            list = q.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
    }
	
	public boolean saveResult(QuizResult result) {
        boolean f = false;
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(result);
            et.commit();
            f = true;
        } catch (Exception e) {
            if(et.isActive()) et.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
        return f;
    }
	
	public List<QuizResult> getHistory(int studentId) {
        List<QuizResult> list = new ArrayList<>();
        try {
            String jpql = "SELECT r FROM QuizResult r WHERE r.studentId = :id ORDER BY r.testDate DESC";
            TypedQuery<QuizResult> q = em.createQuery(jpql, QuizResult.class);
            q.setParameter("id", studentId);
            list = q.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
    }
	
	public boolean addQuestion(Question q) {
        boolean f = false;
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(q); // Save the question object
            et.commit();
            f = true;
        } catch (Exception e) {
            if(et.isActive()) et.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
        return f;
    }
}
