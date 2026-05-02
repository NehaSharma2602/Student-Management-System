package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.LoginValidate;

import model.entity.Staff;
import model.entity.Student;

@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginValidateServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role =  req.getParameter("role");
		
		HttpSession session = req.getSession();
		LoginValidate lv = new LoginValidate();
		
		if("student".equals(role)) {
			Student s = lv.validateStudent(email, password);
			if(s != null) {
				session.setAttribute("userObj", s);
				session.setAttribute("role", "student");
				req.getRequestDispatcher("studentDash.jsp").forward(req, resp);
			} else {
				req.setAttribute("msg", "Invalid Student Email or Password");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
				
			}
		}
		
		else if("staff".equals(role)) {
			Staff st = lv.validateStaff(email, password);
			if(st != null) {
				session.setAttribute("userObj", st);
                session.setAttribute("role", "staff");
                req.getRequestDispatcher("staffDash.jsp").forward(req, resp);
			} else {
				req.setAttribute("msg", "Invalid Staff Email or Password");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
				
			}
		}
		
		else if("admin".equals(role)) {
			boolean isAdmin = lv.validateAdmin(email, password);
			if(isAdmin) {
				session.setAttribute("userObj", "admin");
                session.setAttribute("role", "admin");
                req.getRequestDispatcher("adminDash.jsp").forward(req, resp);
			} else {
				req.setAttribute("msg", "Invalid Admin Email or Password");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
				
			}
		}
	}
}
