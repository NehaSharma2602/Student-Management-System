package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.dao.StaffDao;
import model.entity.Staff;

@MultipartConfig
@WebServlet("/add_staff")
public class AddStaffServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String designation = req.getParameter("designation");
		String department = req.getParameter("department");
		
		Part part = req.getPart("img");
		String filename = part.getSubmittedFileName();
		
		Staff st = new Staff();
		
		st.setName(name);
		st.setEmail(email);
		st.setPassword(password);
		st.setDesignation(designation);
		st.setDepartment(department);
		st.setProfilePic(filename);
		
		StaffDao dao = new StaffDao();
		
		boolean res = dao.addStaff(st);
		
		if(res) {
			// 1. DEFINING  BOTH PATHS
			// Path A: The "Source" (Permanent storage in the project folder)
			String sourcePath = "academia_connect\\src\\main\\webapp\\images";  // project/src/main/webapp/images --> Fully path

			// Path B: The "Server" (Temporary storage for instant viewing)
			String deployPath = getServletContext().getRealPath("") + "images";

			// Create folders if they don't exist
			File sourceDir = new File(sourcePath);
			if(!sourceDir.exists()) sourceDir.mkdir();

			File deployDir = new File(deployPath);
			if(!deployDir.exists()) deployDir.mkdir();

			// 2. SAVE TO SOURCE (Permanent)
			// We use part.write() ONLY ONCE.
			String sourceFileFull = sourcePath + File.separator + filename;
			part.write(sourceFileFull); 

			// 3. COPY TO DEPLOY (Instant View)
			// Now we copy the file we just saved to the server folder
			String deployFileFull = deployPath + File.separator + filename;

			Files.copy(
			    Paths.get(sourceFileFull),      // Copy FROM source
			    Paths.get(deployFileFull),      // Paste TO server
			    StandardCopyOption.REPLACE_EXISTING // Overwrite if exists
			);
			
			req.getSession().setAttribute("msg", "Staff Added Successfully!");
            resp.sendRedirect("addStaff.jsp");
			
		} else {

            req.setAttribute("msg", "Failed to register staff. Please try again.");
            req.getRequestDispatcher("addStaff.jsp").forward(req, resp);
        }
		
		
	}
}
