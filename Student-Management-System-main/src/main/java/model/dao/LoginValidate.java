package model.dao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import model.entity.Admin;
import model.entity.Staff;
import model.entity.Student;
import model.utility.HibernateUtil;

public class LoginValidate {

	EntityManager em;

	public LoginValidate() {
		em = HibernateUtil.getFactroy().createEntityManager();
	}

	public Student validateStudent(String email, String password) {

		Student student = null;
        try {
            String jpql = "SELECT s FROM Student s WHERE s.email = :e AND s.password = :p";
            TypedQuery<Student> q = em.createQuery(jpql, Student.class);
            q.setParameter("e", email);
            q.setParameter("p", password);
            
            List<Student> list = q.getResultList();
            if(!list.isEmpty()) {
                student = list.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return student;
    }

	public Staff validateStaff(String email, String password) {

		Staff staff = null;
        try {
            String jpql = "SELECT s FROM Staff s WHERE s.email = :e AND s.password = :p";
            TypedQuery<Staff> q = em.createQuery(jpql, Staff.class);
            q.setParameter("e", email);
            q.setParameter("p", password);
            
            // getSingleResult throws exception if no result found, so we use getResultList
            List<Staff> list = q.getResultList();
            if(!list.isEmpty()) {
                staff = list.get(0); // Get the first matching user
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return staff;
	}
	
	public boolean validateAdmin(String username, String password) {
		
		boolean status = false;

        try {
            
            String jpql = "SELECT a FROM Admin a WHERE a.username = :u AND a.password = :p";
            TypedQuery<Admin> q = em.createQuery(jpql, Admin.class);
            q.setParameter("u", username);
            q.setParameter("p", password);
            
            // If a result is found, the list will not be empty
            List<Admin> list = q.getResultList();
            if(!list.isEmpty()) {
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return status;
	}
}
