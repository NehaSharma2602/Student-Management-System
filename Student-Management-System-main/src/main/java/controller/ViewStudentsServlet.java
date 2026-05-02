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

@WebServlet("/ViewStudentsServlet")
public class ViewStudentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String branch = req.getParameter("branch");
        String semester = req.getParameter("semester");
        
        StudentDao dao = new StudentDao();
        List<Student> list = null;

        // If user selected both options, filter the list
        if(branch != null && semester != null && !branch.equals("select") && !semester.equals("select")) {
            list = dao.getStudentsByBranchAndSem(branch, semester);
        } else {
            // Optional: Load ALL students if nothing selected (or keep list empty)
            // list = dao.getAllStudents(""); 
            // For now, WE keep it null or empty so the page asks them to search first
        }
        
        req.setAttribute("studentList", list);
        req.getRequestDispatcher("staff_view_students.jsp").forward(req, resp);
    }
}
