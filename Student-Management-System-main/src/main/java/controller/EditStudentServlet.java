package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StudentDao;
import model.entity.Student;


@WebServlet("/EditStudentServlet")
public class EditStudentServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		StudentDao dao = new StudentDao();
		
		Student s = dao.getStudentById(id);
		
		req.setAttribute("student", s); // Send this object to JSP
        req.getRequestDispatcher("updateStudent.jsp").forward(req, resp);
	}
}
