<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%
    Object user = session.getAttribute("userObj");
    String role = (String) session.getAttribute("role");
    
    if(user == null || role == null || !role.equals("student")){
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { font-family: 'Segoe UI', sans-serif; display: flex; margin: 0; background-color: #f4f6f9; }
        
        /* SIDEBAR */
        .sidebar { width: 250px; background-color: #2c3e50; color: white; height: 100vh; position: fixed; }
        .sidebar-header { padding: 20px; background-color: #1a252f; text-align: center; font-weight: bold; font-size: 20px; border-bottom: 1px solid #4b545c;}
        .nav-link { display: block; padding: 15px 20px; color: #b8c7ce; text-decoration: none; transition: 0.3s; border-bottom: 1px solid #34495e;}
        .nav-link:hover { background-color: #34495e; color: white; padding-left: 25px; }
        .nav-link i { margin-right: 10px; width: 20px; }

        /* CONTENT */
        .content { margin-left: 250px; padding: 30px; width: 100%; }
        
        .header-welcome {
            background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: flex; align-items: center; justify-content: space-between; margin-bottom: 30px;
        }
        
        .main-grid { display: grid; grid-template-columns: 1fr 2fr; gap: 30px; }
        
        /* PROFILE CARD */
        .profile-card { background: white; padding: 30px; border-radius: 10px; text-align: center; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .profile-img { width: 120px; height: 120px; border-radius: 50%; object-fit: cover; border: 4px solid #3498db; margin-bottom: 15px; }
        .badge { background: #e1f5fe; color: #0288d1; padding: 5px 10px; border-radius: 15px; font-size: 12px; font-weight: bold; }

        /* QUIZ CARDS */
        .quiz-section h3 { margin-top: 0; color: #333; }
        .quiz-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; }
        
        .quiz-card { background: white; padding: 20px; border-radius: 8px; border-left: 5px solid #28a745; box-shadow: 0 2px 5px rgba(0,0,0,0.1); transition: 0.3s; }
        .quiz-card:hover { transform: translateY(-5px); box-shadow: 0 5px 15px rgba(0,0,0,0.15); }
        .quiz-card h4 { margin: 0 0 10px; color: #333; }
        .quiz-card p { font-size: 13px; color: #666; margin-bottom: 15px; }
        .btn-start { display: inline-block; padding: 8px 15px; background: #28a745; color: white; text-decoration: none; border-radius: 4px; font-size: 14px; }
        .btn-start:hover { background: #218838; }

    </style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header"><i class="fas fa-graduation-cap"></i> Student Panel</div>
        
        <a href="studentDash.jsp" class="nav-link"><i class="fas fa-home"></i> Dashboard</a>
        <a href="ViewHistoryServlet" class="nav-link"><i class="fas fa-history"></i> My Quiz History</a> 
        <a href="LogOutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        
        <div class="header-welcome">
            <div>
                <h2 style="margin:0;">Welcome back, ${userObj.name}</h2>
                <p style="margin:5px 0 0; color:#777;">Ready to learn something new today?</p>
            </div>
            <div>
                 <span style="font-weight:bold; color:#555;">${userObj.branch} | Sem ${userObj.semester}</span>
            </div>
        </div>

        <div class="main-grid">
            
            <div class="profile-card">
                <img src="${pageContext.request.contextPath}/images/${userObj.profilePic}" class="profile-img" alt="Student">
                <h3>${userObj.name}</h3>
                <span class="badge">Student</span>
                <p style="color:#777; margin-top:10px;">${userObj.email}</p>
                <hr style="border:0; border-top:1px solid #eee; margin: 20px 0;">
                <div style="text-align:left; font-size:14px; color:#555;">
                    <p><i class="fas fa-university" style="width:20px; color:#3498db;"></i> <strong>Branch:</strong> ${userObj.branch}</p>
                    <p><i class="fas fa-layer-group" style="width:20px; color:#3498db;"></i> <strong>Semester:</strong> ${userObj.semester}</p>
                </div>
            </div>

            <div class="quiz-section">
                <h3><i class="fas fa-laptop-code"></i> Available Quizzes</h3>
                
                <div class="quiz-grid">
                    <div class="quiz-card">
                        <h4>Java Core</h4>
                        <p>5 Questions • Basic Concepts</p>
                        <a href="StartQuizServlet?subject=Java" class="btn-start">Start Quiz <i class="fas fa-arrow-right"></i></a>
                    </div>
                    
                    <div class="quiz-card" style="border-left-color: #ffc107;">
                        <h4>Python Basics</h4>
                        <p>5 Questions • Syntax & Logic</p>
                        <a href="StartQuizServlet?subject=Python" class="btn-start" style="background:#ffc107; color:black;">Start Quiz <i class="fas fa-arrow-right"></i></a>
                    </div>
                    
                    <div class="quiz-card" style="border-left-color: #ffc107;">
                        <h4>DBMS</h4>
                        <p>5 Questions • Syntax & Logic</p>
                        <a href="StartQuizServlet?subject=DBMS" class="btn-start" style="background:#ffc107; color:black;">Start Quiz <i class="fas fa-arrow-right"></i></a>
                    </div>
                    
                    <div class="quiz-card" style="border-left-color: #ffc107;">
                        <h4>HTML</h4>
                        <p>5 Questions • Syntax & Logic</p>
                        <a href="StartQuizServlet?subject=HTML" class="btn-start" style="background:#ffc107; color:black;">Start Quiz <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                
                <br><br>
                <h3><i class="fas fa-chart-line"></i> Recent Activity</h3>

<%@ page import="model.dao.QuizDao" %>
<%@ page import="model.entity.QuizResult" %>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Student" %>

<%
    // 1. Get current student from session
    Student currentStudent = (Student) session.getAttribute("userObj");
    
    if(currentStudent != null) {
        // 2. Fetch History
        QuizDao qDao = new QuizDao();
        List<QuizResult> recentList = qDao.getHistory(currentStudent.getId());
        
        // 3. Display Logic
        if(recentList.isEmpty()) {
%>
            <p style="color:#777;">No tests taken yet. Start a quiz above!</p>
<%
        } else {
            // Show only top 3 results
            int count = 0;
            for(QuizResult res : recentList) {
                if(count >= 3) break; // Limit to 3
%>
                <div style="background: #f8f9fa; padding: 10px; border-left: 4px solid #007bff; margin-bottom: 10px; border-radius: 4px;">
                    <strong style="color:#333;"><%= res.getSubject() %></strong>
                    <span style="float:right; font-weight:bold; color: <%= (res.getMarks() > 0) ? "#28a745" : "red" %>;">
                        <%= res.getMarks() %> / <%= res.getTotalMarks() %>
                    </span>
                    <br>
                    <small style="color:#666;">Taken on: <%= res.getTestDate() %></small>
                </div>
<%
                count++;
            }
%>
            <div style="text-align:right; margin-top:10px;">
                <a href="ViewHistoryServlet" style="font-size:13px; text-decoration:none;">View All History &rarr;</a>
            </div>
<%
        }
    }
%>
                </div>
        </div>
    </div>

</body>
</html>