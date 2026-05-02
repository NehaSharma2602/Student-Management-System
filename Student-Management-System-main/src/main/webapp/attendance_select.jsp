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
<html>
<head>
<title>Take Attendance</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body { font-family: 'Segoe UI', sans-serif; background-color: #f4f6f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
    
    .card { 
        background: white; 
        padding: 40px; 
        border-radius: 8px; 
        box-shadow: 0 4px 15px rgba(0,0,0,0.1); 
        width: 400px; 
        text-align: center;
    }
    
    h2 { color: #333; margin-bottom: 25px; }
    
    .form-group { margin-bottom: 20px; text-align: left; }
    label { font-weight: bold; color: #555; display: block; margin-bottom: 5px; font-size: 14px; }
    
    select, input { 
        width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; font-size: 14px;
    }
    
    button { 
        width: 100%; background-color: #28a745; color: white; border: none; padding: 12px; 
        font-size: 16px; font-weight: bold; border-radius: 5px; cursor: pointer; margin-top: 10px; transition: 0.3s;
    }
    button:hover { background-color: #218838; }
    
    .btn-back { display: block; margin-top: 15px; color: #666; text-decoration: none; font-size: 14px; }
    .btn-back:hover { text-decoration: underline; }
</style>
</head>
<body>

    <div class="card">
        <h2><i class="fas fa-clipboard-check"></i> Take Attendance</h2>
        
        <form action="LoadAttendanceSheetServlet" method="get">
            
            <div class="form-group">
                <label>Subject Name</label>
                <input type="text" name="subject" placeholder="e.g. Core Java" required>
            </div>
            
            <div class="form-group">
                <label>Select Branch</label>
                <select name="branch" required>
                    <option value="" disabled selected>-- Select --</option>
                    <option value="CSE">Computer Science (CSE)</option>
                    <option value="ECE">Electronics (ECE)</option>
                    <option value="ME">Mechanical (ME)</option>
                    <option value="CE">Civil (CE)</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Select Semester</label>
                <select name="semester" required>
                    <option value="" disabled selected>-- Select --</option>
                    <option value="1">1st Semester</option>
                    <option value="2">2nd Semester</option>
                    <option value="3">3rd Semester</option>
                    <option value="4">4th Semester</option>
                    <option value="5">5th Semester</option>
                    <option value="6">6th Semester</option>
                    <option value="7">7th Semester</option>
                    <option value="8">8th Semester</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Date</label>
                <input type="date" name="date" required>
            </div>
            
            <button type="submit">Next <i class="fas fa-arrow-right"></i></button>
        </form>
        
        <a href="staffDash.jsp" class="btn-back">Back to Dashboard</a>
    </div>

</body>
</html>