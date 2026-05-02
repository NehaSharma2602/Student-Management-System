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
import model.entity.QuizResult;
import model.entity.Student;
import java.util.Date;

@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		// 1. Get the original questions from session (The Answer Key)
		List<Question> questions = (List<Question>) session.getAttribute("examQuestions");
		String subject = (String) session.getAttribute("examSubject");
		Student student = (Student) session.getAttribute("userObj");

		if (questions == null || student == null) {
			resp.sendRedirect("studentDash.jsp");
			return;
		}

		int score = 0;
		int total = questions.size();

		// 2. Loop through questions and check answers
		for (Question q : questions) {
			// User's answer from the form (name="ans_12", "ans_13", etc.)
			String userAnswer = req.getParameter("ans_" + q.getId());

			if (userAnswer != null) {
				if (userAnswer.equals(q.getAnswer())) {
					score++;
				}
			}
		}

		// 3. Create Result Object
		QuizResult res = new QuizResult();
		res.setStudentId(student.getId());
		res.setSubject(subject);
		res.setMarks(score);
		res.setTotalMarks(total);
		res.setTestDate(new Date()); // Current Time

		// 4. Save to Database
		QuizDao dao = new QuizDao();
		boolean f = dao.saveResult(res);

		if (f) {
			// Remove quiz data from session so they can't re-submit
			session.removeAttribute("examQuestions");

			// Send to Result Page
			req.setAttribute("myScore", score);
			req.setAttribute("myTotal", total);
			req.getRequestDispatcher("quiz_result_view.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("studentDash.jsp");
		}
	}
}
