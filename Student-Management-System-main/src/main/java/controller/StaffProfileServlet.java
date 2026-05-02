package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.StaffDao;
import model.entity.Staff;


@WebServlet("/StaffProfileServlet")
public class StaffProfileServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		Staff sessionStaff = (Staff)session.getAttribute("userObj");
		
		if(sessionStaff == null) {
			resp.sendRedirect("index.jsp");
            return;
		}
		StaffDao dao = new StaffDao();
		Staff data = dao.getStaffbyId(sessionStaff.getId());
		
		req.setAttribute("staff", data);
		
        req.getRequestDispatcher("staff_profile.jsp").forward(req, resp);
	}

}
