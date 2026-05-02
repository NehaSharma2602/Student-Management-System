<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("admin")) {
	response.sendRedirect("index.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>View Staff</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>

.container {
    width: 90%;
    margin: 30px auto; /* 100px down + 30px bottom margin */
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


/* Search Bar Styling */
.search-box {
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.search-form {
	display: flex;
	gap: 10px;
}

input[type="text"] {
	padding: 8px;
	width: 250px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.btn-search {
	padding: 8px 15px;
	background: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

th, td {
	border-bottom: 1px solid #ddd;
	padding: 12px;
	text-align: left;
}

th {
	background-color: #f8f9fa;
	color: #333;
}

img {
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid #eee;
}

.empty-msg {
	text-align: center;
	color: #777;
	padding: 20px;
}

.form-actions {
	display: flex;
	gap: 15px;
	margin-top: 40px;
}

.btn {
	padding: 16px 30px;
	border: none;
	border-radius: 10px;
	font-size: 1.1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	flex: 1;
}

.btn-submit {
	background: linear-gradient(to right, var(--primary-color),
		var(--secondary-color));
	color: white;
}

.btn-submit:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 20px rgba(26, 42, 108, 0.2);
}

.btn-back {
	background-color: #f8f9fa;
	color: var(--dark-color);
	border: 2px solid #e1e5eb;
}

.btn-back:hover {
	background-color: #e9ecef;
	transform: translateY(-3px);
}
</style>
</head>
<body>
   
    
	<div class="container">
		<div class="search-box">
			<h2>
				<i class="fas fa-chalkboard-teacher"></i> Staff Directory
			</h2>

			<form action="ViewAllStaff" method="get" class="search-form">

				<input type="text" name="q" placeholder="Search by Name or Email..."
					value="${param.q}">
				<button type="submit" class="btn-search">
					<i class="fas fa-search"></i> Search
				</button>

				<a href="ViewAllStaff"
					style="padding: 8px; text-decoration: none; color: #666;">Clear</a>
			</form>

			<a href="addStaff.jsp"
				style="text-decoration: none; background: #28a745; color: white; padding: 10px; border-radius: 4px;">+
				Add Staff</a>
		</div>

		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Photo</th>
					<th>Name</th>
					<th>Email</th>
					<th>Department</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty sList}">
					<tr>
						<td colspan="6" class="empty-msg">No staff members found. Try
							adding one!</td>
					</tr>
				</c:if>

				<c:forEach items="${sList}" var="s">
					<tr>
						<td>${s.id}</td>
						<td><img
							src="${pageContext.request.contextPath}/images/${s.profilePic}"
							width="50" height="50"></td>
						<td>${s.name}<br> <small style="color: #888;">${s.designation}</small></td>
						<td>${s.email}</td>
						<td>${s.department}</td>
						<td><a href="EditStaffServlet?id=${s.id}"
							class="btn btn-primary" style="color: blue;">Edit</a> | <a
							href="DeleteStaffServlet?id=${s.id}" style="color: red;"
							class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="form-actions">
			<a href="adminDash.jsp" class="btn btn-back"> <i
				class="fas fa-arrow-left"></i> Back to Dashboard
			</a>
		</div>
	</div>

</body>
</html>