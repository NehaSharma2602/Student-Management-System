<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<title>Student List</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body { font-family: sans-serif; background-color: #f4f6f9; padding: 20px; }
    
    .filter-box {
        background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        display: flex; gap: 15px; align-items: center; margin-bottom: 20px;
    }
    select, button { padding: 10px; border-radius: 5px; border: 1px solid #ddd; }
    button { background-color: #007bff; color: white; border: none; cursor: pointer; }
    button:hover { background-color: #0056b3; }
    
    table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background-color: #343a40; color: white; }
    tr:hover { background-color: #f1f1f1; }
    
    .back-btn { text-decoration: none; color: #333; font-weight: bold; margin-bottom: 15px; display: inline-block; }
</style>
</head>
<body>

    <a href="staffDash.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>

    <div class="filter-box">
        <h3><i class="fas fa-filter"></i> Filter Class:</h3>
        <form action="ViewStudentsServlet" method="get" style="display:flex; gap:10px;">
            
            <select name="branch" required>
                <option value="select">-- Select Branch --</option>
                <option value="CSE">Computer Science (CSE)</option>
                <option value="ECE">Electronics (ECE)</option>
                <option value="ME">Mechanical (ME)</option>
                <option value="CE">Civil (CE)</option>
            </select>
            
            <select name="semester" required>
                <option value="select">-- Select Semester --</option>
                <option value="1">1st Semester</option>
                <option value="2">2nd Semester</option>
                <option value="3">3rd Semester</option>
                <option value="4">4th Semester</option>
                <option value="5">5th Semester</option>
                <option value="6">6th Semester</option>
                <option value="7">7th Semester</option>
                <option value="8">8th Semester</option>
            </select>
            
            <button type="submit">Search Students</button>
        </form>
    </div>

    <c:if test="${not empty studentList}">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Photo</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Branch</th>
                    <th>Sem</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${studentList}" var="s">
                    <tr>
                        <td>${s.id}</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/images/${s.profilePic}" width="40" height="40" style="border-radius:50%;">
                        </td>
                        <td>${s.name}</td>
                        <td>${s.email}</td>
                        <td>${s.branch}</td>
                        <td>${s.semester}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty studentList and param.branch ne null}">
        <p style="text-align:center; color: #777;">No students found for this class.</p>
    </c:if>

</body>
</html>