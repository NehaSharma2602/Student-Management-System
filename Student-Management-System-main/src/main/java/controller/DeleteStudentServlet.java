package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StudentDao;


@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		StudentDao dao = new StudentDao();
		boolean res = dao.deleteStudent(id);
		if (res) {
			req.getSession().setAttribute("msg", "Student Deleted Successfully");
		} else {
			req.getSession().setAttribute("msg", "Failed to Delete Student");
		}

		resp.sendRedirect("ViewAllStaff");
	}

}
