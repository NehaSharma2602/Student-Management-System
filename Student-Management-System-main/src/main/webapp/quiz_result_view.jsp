<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Result</title>
<style>
    body { font-family: sans-serif; background: #e9ecef; display: flex; justify-content: center; align-items: center; height: 100vh; text-align: center;}
    .card { background: white; padding: 50px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.2); }
    h1 { color: #28a745; font-size: 50px; margin: 0; }
    p { font-size: 20px; color: #555; }
    .btn { display: inline-block; padding: 10px 20px; background: #007bff; color: white; text-decoration: none; border-radius: 5px; margin-top: 20px;}
</style>
</head>
<body>

<div class="card">
    <h2>Test Submitted Successfully!</h2>
    <p>Your Score:</p>
    <h1>${myScore} / ${myTotal}</h1>
    
    <a href="studentDash.jsp" class="btn">Back to Dashboard</a>
</div>

</body>
</html>