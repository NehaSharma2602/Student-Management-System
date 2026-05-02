<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<title>My Quiz History</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body { font-family: sans-serif; background-color: #f4f6f9; padding: 20px; }
    .container { max-width: 900px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
    h2 { color: #333; border-bottom: 2px solid #007bff; padding-bottom: 10px; display: inline-block; }
    
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background-color: #343a40; color: white; }
    tr:hover { background-color: #f1f1f1; }
    
    .pass { color: green; font-weight: bold; }
    .fail { color: red; font-weight: bold; }
    
    .btn-back { display: inline-block; margin-bottom: 15px; text-decoration: none; color: #555; font-weight: bold; }
</style>
</head>
<body>

<div class="container">
    <a href="studentDash.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    <br>
    <h2><i class="fas fa-history"></i> My Test History</h2>

    <c:if test="${empty historyList}">
        <p style="color:#777; margin-top:20px;">You haven't taken any tests yet.</p>
    </c:if>

    <c:if test="${not empty historyList}">
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Subject</th>
                    <th>Marks Obtained</th>
                    <th>Total Marks</th>
                    <th>Result</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${historyList}" var="r">
                    <tr>
                        <td>${r.testDate}</td> <td>${r.subject}</td>
                        <td>${r.marks}</td>
                        <td>${r.totalMarks}</td>
                        <td>
                            <c:choose>
                                <c:when test="${(r.marks * 100 / r.totalMarks) >= 40}">
                                    <span class="pass">PASS</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="fail">FAIL</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>