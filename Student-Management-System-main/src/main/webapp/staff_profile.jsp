<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<title>Staff Profile</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body { font-family: 'Segoe UI', sans-serif; background-color: #f4f6f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
    
    .profile-card {
        background: white;
        width: 350px;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        text-align: center;
        position: relative;
    }
    
    .profile-img {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #007bff;
        margin-bottom: 15px;
    }
    
    h2 { margin: 10px 0 5px; color: #333; }
    p { color: #666; margin: 5px 0; font-size: 15px; }
    
    .badge {
        background-color: #e3f2fd;
        color: #007bff;
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: bold;
        display: inline-block;
        margin-bottom: 15px;
    }
    
    .info-row {
        text-align: left;
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px solid #eee;
    }
    .info-item { margin-bottom: 15px; display: flex; align-items: center; }
    .info-item i { width: 25px; color: #007bff; margin-right: 10px; }
    
    .btn-back {
        position: absolute;
        top: 15px;
        left: 15px;
        color: #666;
        text-decoration: none;
    }
    
    .btn-edit {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        margin-top: 20px;
        font-weight: bold;
        transition: 0.3s;
    }
    .btn-edit:hover { background-color: #0056b3; }
</style>
</head>
<body>

    <div class="profile-card">
        <a href="staffDash.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back</a>

        <img src="${pageContext.request.contextPath}/images/${staff.profilePic}" class="profile-img" alt="Profile">
        
        <h2>${staff.name}</h2>
        <span class="badge">${staff.designation}</span>
        
        <div class="info-row">
            <div class="info-item">
                <i class="fas fa-envelope"></i>
                <span>${staff.email}</span>
            </div>
            <div class="info-item">
                <i class="fas fa-building"></i>
                <span>Department of ${staff.department}</span>
            </div>
            <div class="info-item">
                <i class="fas fa-id-badge"></i>
                <span>Staff ID: ${staff.id}</span>
            </div>
        </div>

        <a href="EditStaffProfileServlet?id=${staff.id}" class="btn-edit">Edit My Profile</a>
    </div>

</body>
</html>