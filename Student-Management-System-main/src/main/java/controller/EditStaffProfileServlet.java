package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StaffDao;
import model.entity.Staff;


@WebServlet("/EditStaffProfileServlet")
public class EditStaffProfileServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		StaffDao dao = new StaffDao();
		
		Staff s = dao.getStaffbyId(id);
		
		req.setAttribute("staff", s); // Send this object to JSP
        req.getRequestDispatcher("updateStaffProfile.jsp").forward(req, resp);
	}
}
