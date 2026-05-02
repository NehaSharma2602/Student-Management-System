package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StudentDao;
import model.entity.Student;

@WebServlet("/ViewAllStudent")
public class ViewAllStudentServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDao dao = new StudentDao();
	    List<Student> studentList;

	    String branch = req.getParameter("branch");
	    String semester = req.getParameter("semester");

	    boolean hasBranch = branch != null && !branch.trim().isEmpty();
	    boolean hasSemester = semester != null && !semester.trim().isEmpty();

	    if (hasBranch && hasSemester) {
	        // Case 1: Branch + Semester
	        studentList = dao.getStudentsByBranchAndSem(branch, semester);

	    } else if (hasBranch) {
	        // Case 2: Only Branch
	        studentList = dao.getStudentsByBranch(branch);

	    } else if (hasSemester) {
	        // Case 3: Only Semester
	        studentList = dao.getStudentsBySemester(semester);

	    } else {
	        // Case 4: View All
	        studentList = dao.getAllStudents(null);
	    }

	    req.setAttribute("sList", studentList);
	    req.getRequestDispatcher("viewAllStudent.jsp").forward(req, resp);
	}
}
