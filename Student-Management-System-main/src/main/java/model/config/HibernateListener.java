package model.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import model.utility.HibernateUtil;

public class HibernateListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
	 // it will be called when the app/servler is started
	}
	
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		 // it will be called when the app/servler is stopped
		HibernateUtil.closeFactory();
		
	}
}
