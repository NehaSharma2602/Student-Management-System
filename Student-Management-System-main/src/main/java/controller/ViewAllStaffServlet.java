package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StaffDao;
import model.entity.Staff;

@WebServlet("/ViewAllStaff")
public class ViewAllStaffServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		StaffDao dao = new StaffDao();

		List<Staff> staffList = null;
		
		String query = req.getParameter("q");
		
		if (query != null && !query.trim().isEmpty()) {
            // User is Searching and want to see specific record
            staffList = dao.getStaffBySearch(query);
        } else {
            // User wants to see All the data
            staffList = dao.getAllStaff();
        }

		if(staffList == null || staffList.isEmpty()) {
            System.out.println("SERVLET WARNING: The list sent to JSP is EMPTY.");
        }

        req.setAttribute("sList", staffList);
        req.getRequestDispatcher("viewAllStaff.jsp").forward(req, resp);
	}
}
