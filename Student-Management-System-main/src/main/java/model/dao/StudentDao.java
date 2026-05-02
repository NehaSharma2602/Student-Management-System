package model.dao;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import model.entity.Student;
import model.utility.HibernateUtil;


public class StudentDao {
	EntityManager em;

	public StudentDao() {
		em = HibernateUtil.getFactroy().createEntityManager();
	}

	public boolean addStudent(Student s) {
		boolean f = false;
        EntityTransaction et = em.getTransaction();
        
        try {
            et.begin();
            em.persist(s); // Saves the object to DB automatically
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

	public List<Student> getAllStudents(String search) {
		List<Student> list = new ArrayList<>();
        
        try {
            String jpql;
            TypedQuery<Student> q;
            
            if (search != null && !search.trim().isEmpty()) {
                // JPQL: Filter by name or email
                jpql = "SELECT s FROM Student s WHERE LOWER(s.name) LIKE :k OR LOWER(s.email) LIKE :k ORDER BY s.id DESC";
                q = em.createQuery(jpql, Student.class);
                q.setParameter("k", "%" + search.toLowerCase() + "%");
            } else {
                // JPQL: Select All
                jpql = "SELECT s FROM Student s ORDER BY s.id DESC";
                q = em.createQuery(jpql, Student.class);
            }
            
            list = q.getResultList();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
	}

	public boolean deleteStudent(int id) {
		boolean f = false;
        EntityTransaction et = em.getTransaction();
        
        try {
            et.begin();
            Student s = em.find(Student.class, id);
            if(s != null) {
                em.remove(s); // Deletes the object
                f = true;
            }
            et.commit();
        } catch (Exception e) {
            if(et.isActive()) et.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
        return f;
	}

	public Student getStudentById(int id) {
		Student s = null;
        try {
            s = em.find(Student.class, id); // Finds by Primary Key instantly
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return s;
	}

	public boolean updateStudent(Student stud) {
		boolean f = false;
        EntityTransaction et = em.getTransaction();
        
        try {
            et.begin();
            em.merge(stud); // Updates the record
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

	public List<Student> getStudentsByBranchAndSem(String branch, String semester) {
		List<Student> list = new ArrayList<>();
        try {
            // We cast semester to int for safety, though JPQL can handle strings often
            int sem = Integer.parseInt(semester);
            
            String jpql = "SELECT s FROM Student s WHERE s.branch = :b AND s.semester = :sem";
            TypedQuery<Student> q = em.createQuery(jpql, Student.class);
            q.setParameter("b", branch);
            q.setParameter("sem", sem);
            
            list = q.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
	}

	public List<Student> getStudentsByBranch(String branch) {
		List<Student> list = new ArrayList<>();
        try {
            String jpql = "SELECT s FROM Student s WHERE s.branch = :b";
            TypedQuery<Student> q = em.createQuery(jpql, Student.class);
            q.setParameter("b", branch);
            
            list = q.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
	}

	public List<Student> getStudentsBySemester(String semester) {
		List<Student> list = new ArrayList<>();
        try {
            int sem = Integer.parseInt(semester);
            
            String jpql = "SELECT s FROM Student s WHERE s.semester = :sem";
            TypedQuery<Student> q = em.createQuery(jpql, Student.class);
            q.setParameter("sem", sem);
            
            list = q.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
	}

}
