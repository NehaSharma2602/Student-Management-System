<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>AcademiaConnect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #1a2a6c, #2d8fc7);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .welcome-header {
            text-align: center;
            margin-bottom: 30px;
            color: white;
            width: 100%;
            max-width: 1100px;
        }
        
        .welcome-header h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        
        .welcome-header h1 span {
            color: #ffcc00;
        }
        
        .welcome-header p {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .login-wrapper {
            display: flex;
            width: 100%;
            max-width: 1100px;
            height: 600px;
            background-color: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.25);
        }
        
        .left-section {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: #f8f9fa;
        }
        
        .right-section {
            flex: 1;
            background-image: url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80');
            background-size: cover;
            background-position: center;
            position: relative;
        }
        
        .right-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, rgba(26, 42, 108, 0.7), rgba(45, 143, 199, 0.7));
        }
        
        .right-content {
            position: relative;
            z-index: 2;
            color: white;
            padding: 50px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .right-content h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        
        .right-content p {
            font-size: 1.2rem;
            line-height: 1.6;
            margin-bottom: 30px;
        }
        
        .features {
            list-style: none;
        }
        
        .features li {
            margin-bottom: 15px;
            font-size: 1.1rem;
        }
        
        .features i {
            color: #ffcc00;
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        .login-container h2 {
            color: #1a2a6c;
            margin-bottom: 30px;
            font-size: 2.2rem;
            position: relative;
            padding-bottom: 10px;
        }
        
        .login-container h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 4px;
            background-color: #2d8fc7;
            border-radius: 2px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
        }
        
        .input-with-icon {
            position: relative;
        }
        
        .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }
        
        .input-with-icon input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #ddd;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .input-with-icon input:focus {
            border-color: #2d8fc7;
            outline: none;
            box-shadow: 0 0 0 3px rgba(45, 143, 199, 0.2);
        }
        
        .role-selection {
            margin: 25px 0;
        }
        
        .role-selection h4 {
            margin-bottom: 15px;
            color: #333;
        }
        
        .role-options {
            display: flex;
            gap: 20px;
        }
        
        .role-option {
            flex: 1;
            text-align: center;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .role-option:hover {
            border-color: #2d8fc7;
            background-color: rgba(45, 143, 199, 0.05);
        }
        
        .role-option.selected {
            border-color: #1a2a6c;
            background-color: rgba(26, 42, 108, 0.1);
        }
        
        .role-option input {
            display: none;
        }
        
        .role-option label {
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
            font-weight: 600;
            color: #333;
        }
        
        .role-option i {
            font-size: 1.5rem;
            margin-bottom: 8px;
            color: #1a2a6c;
        }
        
        .login-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(to right, #1a2a6c, #2d8fc7);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .login-btn:hover {
            background: linear-gradient(to right, #2d8fc7, #1a2a6c);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .message {
            text-align: center;
            margin-top: 20px;
            padding: 12px;
            border-radius: 8px;
            font-weight: 500;
        }
        
        .error {
            background-color: rgba(255, 0, 0, 0.1);
            color: #d32f2f;
            border: 1px solid #f5c6cb;
        }
        
        .success {
            background-color: rgba(0, 200, 0, 0.1);
            color: #388e3c;
            border: 1px solid #c3e6cb;
        }
        
        .footer {
            margin-top: 30px;
            color: white;
            text-align: center;
            font-size: 0.9rem;
            opacity: 0.8;
        }
        
        /* Responsive Design */
        @media (max-width: 992px) {
            .login-wrapper {
                flex-direction: column;
                height: auto;
                max-width: 700px;
            }
            
            .right-section {
                order: 1;
                height: 300px;
            }
            
            .left-section {
                order: 2;
            }
            
            .welcome-header h1 {
                font-size: 2.5rem;
            }
        }
        
        @media (max-width: 576px) {
            .left-section, .right-content {
                padding: 30px;
            }
            
            .role-options {
                flex-direction: column;
                gap: 10px;
            }
            
            .welcome-header h1 {
                font-size: 2rem;
            }
            
            .login-container h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="welcome-header">
        <h1>Welcome To <span>AcademiaConnect</span></h1>
        <p>Empowering institutions with smart tools for student, staff, and academic management — all in one unified platform.</p>
    </div>
    
    <div class="login-wrapper">
        <div class="left-section">
            <div class="login-container">
                <h2>Login to Your Account</h2>
                
                <form action="LoginServlet" method="post" id="loginForm">
                    <div class="form-group">
                        <label for="email">Email / Username</label>
                        <div class="input-with-icon">
                            <i class="fas fa-user"></i>
                            <input type="text" id="email" name="email" required placeholder="Enter your email or username">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-with-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="password" name="password" required placeholder="Enter your password">
                        </div>
                    </div>
                    
                    <div class="role-selection">
                        <h4>Login As:</h4>
                        <div class="role-options">
                            <div class="role-option" onclick="selectRole('student')" id="student-option">
                                <input type="radio" id="student" name="role" value="student" checked>
                                <label for="student">
                                    <i class="fas fa-graduation-cap"></i>
                                    Student
                                </label>
                            </div>
                            
                            <div class="role-option" onclick="selectRole('staff')" id="staff-option">
                                <input type="radio" id="staff" name="role" value="staff">
                                <label for="staff">
                                    <i class="fas fa-chalkboard-teacher"></i>
                                    Staff
                                </label>
                            </div>
                            
                            <div class="role-option" onclick="selectRole('admin')" id="admin-option">
                                <input type="radio" id="admin" name="role" value="admin">
                                <label for="admin">
                                    <i class="fas fa-user-shield"></i>
                                    Admin
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <button type="submit" class="login-btn">
                        <i class="fas fa-sign-in-alt"></i> Login to AcademiaConnect
                    </button>
                </form>
                
                <%
                   String msg = (String) request.getAttribute("msg");
                   if(msg != null){
                %>
                <div class="message error">
                    <i class="fas fa-exclamation-circle"></i> <%= msg %>
                </div>
                <%
                   }
                %>
            </div>
        </div>
        
        <div class="right-section">
            <div class="right-content">
                <h2>Empowering Education</h2>
                <p>AcademiaConnect is a comprehensive student management system designed to streamline academic processes, enhance communication, and foster educational growth.</p>
                
                <ul class="features">
                    <li><i class="fas fa-check-circle"></i> Centralized student information management</li>
                    <li><i class="fas fa-check-circle"></i> Real-time academic performance tracking</li>
                    <li><i class="fas fa-check-circle"></i> Seamless communication between staff and students</li>
                    <li><i class="fas fa-check-circle"></i> Secure data handling with role-based access</li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="footer">
        <p>&copy; 2023 AcademiaConnect. All rights reserved.</p>
    </div>
    
    <script>
        // Initialize with student selected (matching the radio button checked attribute)
        document.addEventListener('DOMContentLoaded', function() {
            // Find which radio button is actually checked
            const checkedRadio = document.querySelector('input[name="role"]:checked');
            if (checkedRadio) {
                selectRole(checkedRadio.value);
            } else {
                // Default to student if none is checked
                selectRole('student');
            }
        });
        
        function selectRole(role) {
            console.log("Selecting role:", role); // Debug log
            
            // First, uncheck all radio buttons
            document.querySelectorAll('input[name="role"]').forEach(radio => {
                radio.checked = false;
            });
            
            // Then, check the selected radio button
            const selectedRadio = document.getElementById(role);
            if (selectedRadio) {
                selectedRadio.checked = true;
                console.log("Radio button checked:", selectedRadio.checked); // Debug log
            }
            
            // Remove selected class from all options
            document.querySelectorAll('.role-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            // Add selected class to clicked option
            const selectedOption = document.getElementById(role + '-option');
            if (selectedOption) {
                selectedOption.classList.add('selected');
            }
        }
        
        // Also handle click on the label inside role-option
        document.querySelectorAll('.role-option label').forEach(label => {
            label.addEventListener('click', function(e) {
                // Don't trigger twice if clicking the label
                e.stopPropagation();
            });
        });
        
        // Form validation
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value.trim();
            const selectedRole = document.querySelector('input[name="role"]:checked');
            
            console.log("Form submission - Selected role:", selectedRole ? selectedRole.value : "none"); // Debug log
            
            if (!email || !password || !selectedRole) {
                e.preventDefault();
                alert('Please fill in all required fields and select a role.');
            }
        });
    </script>
</body>
</html>