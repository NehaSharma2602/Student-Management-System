package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StaffDao;

@WebServlet("/DeleteStaffServlet")
public class DeletStaffServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		StaffDao dao = new StaffDao();
		boolean res = dao.deleteStaff(id);
		
		if(res) {
			req.getSession().setAttribute("msg", "Staff Deleted Successfully");
		} else {
			req.getSession().setAttribute("msg", "Failed to Delete Staff");
		}
		
		resp.sendRedirect("ViewAllStaff");
	}
}
