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
import model.entity.Question;



@WebServlet("/StartQuizServlet")
public class StartQuizServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subject = req.getParameter("subject"); // e.g. "Java"

		QuizDao dao = new QuizDao();
		List<Question> list = dao.getQuestionsBySubject(subject);

		// Save the list in Session so we can check answers later in the Submit Servlet
		HttpSession session = req.getSession();
		session.setAttribute("examQuestions", list);
		session.setAttribute("examSubject", subject);

		// Send to the Quiz Page
		resp.sendRedirect("quiz_play.jsp");
	}
}
