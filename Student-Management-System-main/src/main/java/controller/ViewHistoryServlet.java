package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.QuizDao;
import model.entity.QuizResult;
import model.entity.Student;


@WebServlet("/ViewHistoryServlet")
public class ViewHistoryServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        Student user = (Student) session.getAttribute("userObj");
        
        if(user == null) {
            resp.sendRedirect("index.jsp");
            return;
        }
        
        // Fetch History from DB
        QuizDao dao = new QuizDao();
        List<QuizResult> historyList = dao.getHistory(user.getId());
        
        // Send to JSP
        req.setAttribute("historyList", historyList);
        req.getRequestDispatcher("student_history.jsp").forward(req, resp);
	}
}
