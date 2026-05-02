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
<title>Add Question</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body { font-family: 'Segoe UI', sans-serif; background-color: #f4f6f9; display: flex; justify-content: center; padding: 40px; }
    
    .form-container {
        background: white; width: 600px; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    
    h2 { margin-top: 0; color: #333; border-bottom: 2px solid #6f42c1; padding-bottom: 10px; display: inline-block; }
    
    .form-group { margin-bottom: 15px; }
    label { font-weight: bold; color: #555; display: block; margin-bottom: 5px; }
    
    input[type="text"], select, textarea { 
        width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; font-size: 14px;
    }
    
    textarea { height: 80px; resize: vertical; }
    
    .row { display: flex; gap: 15px; }
    .col { flex: 1; }
    
    button { 
        width: 100%; background-color: #6f42c1; color: white; border: none; padding: 12px; 
        font-size: 16px; font-weight: bold; border-radius: 5px; cursor: pointer; margin-top: 10px;
    }
    button:hover { background-color: #5a32a3; }
    
    .msg { 
        background-color: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin-bottom: 15px; text-align: center;
    }
    
    .back-link { display: block; margin-top: 15px; text-align: center; color: #666; text-decoration: none; }
</style>
</head>
<body>

    <div class="form-container">
        <h2><i class="fas fa-question-circle"></i> Add New Question</h2>
        
        <c:if test="${not empty msg}">
            <div class="msg">${msg}</div>
            <c:remove var="msg" scope="session"/>
        </c:if>

        <form action="AddQuestionServlet" method="post">
            
            <div class="form-group">
                <label>Subject</label>
                <select name="subject" required>
                    <option value="" disabled selected>-- Select Subject --</option>
                    <option value="Java">Java Core</option>
                    <option value="Python">Python</option>
                    <option value="C++">C++</option>
                    <option value="HTML">HTML</option>
                    <option value="DBMS">DBMS</option>
                </select>
            </div>

            <div class="form-group">
                <label>Question Text</label>
                <textarea name="question" placeholder="Enter the question here..." required></textarea>
            </div>

            <div class="row">
                <div class="col form-group">
                    <label>Option A</label>
                    <input type="text" name="optA" required>
                </div>
                <div class="col form-group">
                    <label>Option B</label>
                    <input type="text" name="optB" required>
                </div>
            </div>

            <div class="row">
                <div class="col form-group">
                    <label>Option C</label>
                    <input type="text" name="optC" required>
                </div>
                <div class="col form-group">
                    <label>Option D</label>
                    <input type="text" name="optD" required>
                </div>
            </div>

            <div class="form-group">
                <label>Correct Answer</label>
                <select name="answer" required style="background-color: #f8f9fa;">
                    <option value="" disabled selected>-- Select Correct Option --</option>
                    <option value="A">Option A</option>
                    <option value="B">Option B</option>
                    <option value="C">Option C</option>
                    <option value="D">Option D</option>
                </select>
            </div>

            <button type="submit">Save Question</button>
        </form>
        
        <a href="staffDash.jsp" class="back-link">Back to Dashboard</a>
    </div>

</body>
</html>