package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import model.entity.Staff;
import model.utility.HibernateUtil;

public class StaffDao {
	EntityManager em;
	
	public StaffDao() {
		em = HibernateUtil.getFactroy().createEntityManager();
	}
	
	// -------------To Add New Staff Member
	public boolean addStaff(Staff st) {
		boolean f = false;
        EntityTransaction et = em.getTransaction();
        
        try {
            et.begin();
            em.persist(st); // This generates the INSERT SQL automatically
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
	
	//get All the staff
	
	public List<Staff> getAllStaff() {
		
        
        String jpql = "SELECT s FROM Staff s"; 
        TypedQuery<Staff> q = em.createQuery(jpql, Staff.class);
        List<Staff> list = q.getResultList();
        em.close();
        return list;
	}
	
	//----------To Get the staff or filter the staff based on email or name 
	public List<Staff> getStaffBySearch(String keyword){
		List<Staff> list = null;
		
		try {
	        // JPQL Query: Notice we use 'Staff' (Class Name) and 's.name' (Field Name)
	        String jpql = "SELECT s FROM Staff s WHERE LOWER(s.name) LIKE :k OR LOWER(s.email) LIKE :k";
	        
	        TypedQuery<Staff> q = em.createQuery(jpql, Staff.class);
	        
	        // Create the pattern %keyword%
	        String searchPattern = "%" + keyword.toLowerCase() + "%";
	        
	        // Bind the parameter safely using setParameter
	        q.setParameter("k", searchPattern);
	        
	        list = q.getResultList();
	        
	        System.out.println("DAO: Search found " + list.size() + " results for: " + keyword);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        // If error, return empty list to prevent NullPointerExceptions in JSP
	        list = new ArrayList<>(); 
	    } finally {
	        em.close();
	    }
	    
	    return list;
	}
	
	//-----------To Delete Staff By Id
	
	public boolean deleteStaff(int id) {
		
		boolean f = false;

        EntityTransaction et = em.getTransaction();
        
        try {
            et.begin();
            Staff s = em.find(Staff.class, id);
            if(s != null) {
                em.remove(s); // Delete logic
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
	
	//-----------------To get the staff based of their id's
	
	public Staff getStaffbyId(int id){
		Staff s = em.find(Staff.class, id); // Finds by Primary Key instantly
        em.close();
        return s;
	}
	
	//-------------Update Staff Member
	public boolean updateStaff(Staff s) {
		
		boolean f = false;

        EntityTransaction et = em.getTransaction();
        
        try {
            et.begin();
            em.merge(s); // Update logic (Merging changes)
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
