package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.QuizDao;
import model.entity.Question;

@WebServlet("/AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
            // 1. Fetch Data
            String subject = req.getParameter("subject");
            String questionText = req.getParameter("question");
            String optA = req.getParameter("optA");
            String optB = req.getParameter("optB");
            String optC = req.getParameter("optC");
            String optD = req.getParameter("optD");
            String answer = req.getParameter("answer"); // Will be 'A', 'B', 'C', or 'D'

            // 2. Create Object
            Question q = new Question();
            q.setSubject(subject);
            q.setQuestion(questionText);
            q.setOptionA(optA);
            q.setOptionB(optB);
            q.setOptionC(optC);
            q.setOptionD(optD);
            q.setAnswer(answer);

            // 3. Save to DB
            QuizDao dao = new QuizDao();
            boolean f = dao.addQuestion(q);
            
            HttpSession session = req.getSession();
            
            if(f) {
                session.setAttribute("msg", "Question Added Successfully!");
            } else {
                session.setAttribute("msg", "Something went wrong on server.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("msg", "Error: " + e.getMessage());
        }
        
        // 4. Redirect back to the form so they can add another one immediately
        resp.sendRedirect("add_question.jsp");
	}
}
