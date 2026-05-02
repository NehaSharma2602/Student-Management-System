package model.utility;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class HibernateUtil {
	private static EntityManagerFactory emf;

	static {
		try {
			emf = Persistence.createEntityManagerFactory("academia_connect");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public static EntityManagerFactory getFactroy() {
		return emf;

	}

	public static void closeFactory() {
		emf.close();
	}

}
