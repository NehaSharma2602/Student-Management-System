package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false); // Fetch session if it exists, don't create new one

		if (session != null) {
			// 1. Remove attributes (Optional, as invalidate does this, but good for
			// clarity)
			session.removeAttribute("userObj");
			session.removeAttribute("role");
			session.removeAttribute("msg");

			// 2. Kill the session completely
			session.invalidate();
		}


		resp.sendRedirect("index.jsp");
	}

}
