<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%
    Object user = session.getAttribute("userObj");
    String role = (String) session.getAttribute("role");
    
    if(user == null || role == null || !role.equals("staff")){
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Segoe UI', sans-serif; display: flex; margin: 0; background-color: #f4f6f9; }
        
        /* Sidebar Styles */
        .sidebar { width: 250px; background-color: #343a40; color: white; height: 100vh; position: fixed; }
        .sidebar-header { padding: 20px; background-color: #23272b; text-align: center; font-weight: bold; font-size: 20px;}
        .nav-link { display: block; padding: 15px 20px; color: #c2c7d0; text-decoration: none; transition: 0.3s; border-bottom: 1px solid #4b545c;}
        .nav-link:hover { background-color: #494e53; color: white; padding-left: 25px; }
        .nav-link i { margin-right: 10px; width: 20px; }
        
        /* Content Styles */
        .content { margin-left: 250px; padding: 20px; width: 100%; }
        .header { background: white; padding: 15px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); display: flex; justify-content: space-between; align-items: center; border-radius: 5px; }
        
        /* Card Styles */
        .card-container { display: flex; gap: 20px; margin-top: 20px; flex-wrap: wrap; }
        
        /* Removes underline from the link wrapping the card */
        .card-link { text-decoration: none; color: inherit; }
        
        .card { 
            background: white; 
            padding: 25px; 
            border-radius: 8px; 
            width: 200px; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
            text-align: center; 
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }
        
        /* Hover Effect for Cards */
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.1);
        }
        
        .card h3 { margin: 15px 0 5px; color: #333; font-size: 18px; }
        .card p { color: #777; font-size: 14px; margin: 0; }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header">
            <i class="fas fa-chalkboard-teacher"></i> Staff Panel
        </div>
        
        <a href="staffDash.jsp" class="nav-link"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="StaffProfileServlet" class="nav-link"><i class="fas fa-user-circle"></i> My Profile</a>
        <a href="ViewStudentsServlet" class="nav-link"><i class="fas fa-user-graduate"></i> Student List</a>
        <a href="AttendanceSelect.jsp" class="nav-link"><i class="fas fa-clipboard-check"></i> Take Attendance</a>
        
        <a href="add_question.jsp" class="nav-link"><i class="fas fa-question-circle"></i> Add Questions</a>
        
        <a href="LogOutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <div class="header">
            <h3>Welcome, ${userObj.name}</h3> 
            <div>
                <span style="font-weight: bold; color: #555;">${userObj.department} Department</span>
                <img src="images/${userObj.profilePic}" width="40" height="40" style="border-radius:50%; margin-left:10px; vertical-align:middle; border: 2px solid #ddd;">
            </div>
        </div>

        <div class="card-container">
            
            <a href="ViewStudentsServlet" class="card-link">
                <div class="card">
                    <i class="fas fa-user-graduate fa-3x" style="color: #007bff;"></i>
                    <h3>View Students</h3>
                    <p>Check class lists</p>
                </div>
            </a>

            <a href="attendance_select.jsp" class="card-link">
                <div class="card">
                    <i class="fas fa-clipboard-check fa-3x" style="color: #28a745;"></i>
                    <h3>Attendance</h3>
                    <p>Mark Today's Presence</p>
                </div>
            </a>

            <a href="add_question.jsp" class="card-link">
                <div class="card">
                    <i class="fas fa-question-circle fa-3x" style="color: #6f42c1;"></i> <h3>Add Questions</h3>
                    <p>Update Quiz Bank</p>
                </div>
            </a>

            <a href="StaffProfileServlet" class="card-link">
                <div class="card">
                    <i class="fas fa-user-edit fa-3x" style="color: #ffc107;"></i>
                    <h3>My Profile</h3>
                    <p>Update info & password</p>
                </div>
            </a>

        </div>
    </div>

</body>
</html>