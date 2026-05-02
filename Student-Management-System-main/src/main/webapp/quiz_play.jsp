<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<c:if test="${empty examQuestions}">
    <c:redirect url="studentDash.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<title>Quiz Time</title>
<style>
    body { font-family: sans-serif; background-color: #f4f6f9; padding: 20px; }
    .quiz-container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
    h2 { text-align: center; color: #007bff; }
    .question-box { margin-bottom: 20px; padding: 15px; border-bottom: 1px solid #eee; }
    .q-text { font-weight: bold; font-size: 18px; margin-bottom: 10px; }
    .options label { display: block; margin: 5px 0; cursor: pointer; }
    .btn-submit { display: block; width: 100%; padding: 15px; background: #28a745; color: white; font-size: 18px; border: none; cursor: pointer; border-radius: 5px; margin-top: 20px;}
    .btn-submit:hover { background: #218838; }
</style>
</head>
<body>

<div class="quiz-container">
    <h2>Subject: ${examSubject}</h2>
    
    <form action="SubmitQuizServlet" method="post">
        
        <c:forEach items="${examQuestions}" var="q" varStatus="loop">
            <div class="question-box">
                <div class="q-text">Q${loop.count}. ${q.question}</div>
                
                <div class="options">
                    <label><input type="radio" name="ans_${q.id}" value="A" required> ${q.optionA}</label>
                    <label><input type="radio" name="ans_${q.id}" value="B"> ${q.optionB}</label>
                    <label><input type="radio" name="ans_${q.id}" value="C"> ${q.optionC}</label>
                    <label><input type="radio" name="ans_${q.id}" value="D"> ${q.optionD}</label>
                </div>
            </div>
        </c:forEach>
        
        <button type="submit" class="btn-submit">Submit Test</button>
    </form>
</div>

</body>
</html>