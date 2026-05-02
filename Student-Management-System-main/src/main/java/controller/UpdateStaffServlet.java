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
import javax.servlet.http.HttpSession; // Import for Session handling
import javax.servlet.http.Part;

import model.dao.StaffDao;
import model.entity.Staff;

@MultipartConfig
@WebServlet("/UpdateStaffServlet")
public class UpdateStaffServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	try {
            // 1. Get the ID
            int id = Integer.parseInt(req.getParameter("id"));

            // 2. FETCH EXISTING DATA FIRST (Crucial Step!)
            StaffDao dao = new StaffDao();
            Staff s = dao.getStaffbyId(id); // Get the current details from DB
            
            // 3. MERGE: Only update fields if the user provided new data
            
            // Name (Update only if not empty)
            String name = req.getParameter("name");
            if(name != null && !name.trim().isEmpty()) {
                s.setName(name);
            }
            
            // Email (Update only if not empty)
            String email = req.getParameter("email");
            if(email != null && !email.trim().isEmpty()) {
                s.setEmail(email);
            }
            
            // Password (Special Logic: If empty, KEEP OLD PASSWORD)
            String pass = req.getParameter("password");
            if(pass != null && !pass.trim().isEmpty()) {
                s.setPassword(pass);
            }
            
            // Designation
            String desig = req.getParameter("designation");
            if(desig != null && !desig.trim().isEmpty()) {
                s.setDesignation(desig);
            }
            
            // Department
            String dept = req.getParameter("department");
            if(dept != null && !dept.trim().isEmpty()) {
                s.setDepartment(dept);
            }

            // 4. IMAGE LOGIC (Smart Check)
            Part part = req.getPart("img");
            String fileName = part.getSubmittedFileName();
            
            // We assume we keep the old image (s.getProfilePic()) UNLESS a new one is found
            boolean isNewImageUploaded = false;
            
            if(fileName != null && !fileName.isEmpty()) {
                s.setProfilePic(fileName); // Update the object with NEW filename
                isNewImageUploaded = true;
            }

            // 5. UPDATE DATABASE
            boolean res = dao.updateStaff(s);

            if(res) {
                // Only Save the File to disk if a NEW one was actually uploaded
                if(isNewImageUploaded) {
                    String sourcePath = "academia_connect\\src\\main\\webapp\\images";  // project/src/main/webapp/images --> Fully path
                    String deployPath = getServletContext().getRealPath("") + "images";
                    
                    File sourceDir = new File(sourcePath);
                    if(!sourceDir.exists()) sourceDir.mkdir();
                    File deployDir = new File(deployPath);
                    if(!deployDir.exists()) deployDir.mkdir();

                    // Save new file
                    String sourceFile = sourcePath + File.separator + fileName;
                    part.write(sourceFile);
                    Files.copy(Paths.get(sourceFile), Paths.get(deployPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
                }
                
                // --- SESSION UPDATE & REDIRECT ---
                HttpSession session = req.getSession();
                
                // Update Session (If user updated themselves)
                Object currentUserObj = session.getAttribute("userObj");
                if (currentUserObj instanceof Staff) {
                    Staff currentSessionUser = (Staff) currentUserObj;
                    if(currentSessionUser.getId() == id) {
                        session.setAttribute("userObj", s); 
                    }
                }

                session.setAttribute("msg", "Profile Updated Successfully!");

                // Redirect based on Role
                String role = (String) session.getAttribute("role");
                if("staff".equals(role)) {
                    resp.sendRedirect("StaffProfileServlet");
                } else {
                    resp.sendRedirect("ViewAllStaff"); 
                }

            } else {
                req.getSession().setAttribute("msg", "Update Failed");
                // Smart Error Redirect
                String role = (String) req.getSession().getAttribute("role");
                if("staff".equals(role)) {
                     resp.sendRedirect("EditStaffProfileServlet?id=" + id);
                } else {
                     resp.sendRedirect("EditStaffServlet?id=" + id);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("msg", "Error: " + e.getMessage());
            // Redirect safely even if ID parsing fails (though unlikely if hidden input exists)
            String redirectId = req.getParameter("id");
            if(redirectId != null) {
                resp.sendRedirect("EditStaffServlet?id=" + redirectId);
            } else {
                resp.sendRedirect("index.jsp"); // Worst case fallback
            }
        }
    }
}