<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // PREVENT BROWSER CACHING
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setHeader("Expires", "0"); // Proxies
    
    // SECURITY CHECK 
    String role = (String) session.getAttribute("role");
    if(role == null || !role.equals("admin")) { // Change "admin" to "staff"/"student" for other dashboards
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Academia Connect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #1a2a6c;
            --secondary-color: #2d8fc7;
            --accent-color: #ffcc00;
            --light-color: #f8f9fa;
            --dark-color: #333;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
            --info-color: #17a2b8;
            --sidebar-width: 280px;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: var(--dark-color);
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        /* Header Styles */
        .admin-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }
        
        .header-left {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .logo {
            font-size: 2.5rem;
            color: var(--accent-color);
        }
        
        .header-title h1 {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }
        
        .header-title p {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .notification-icon {
            position: relative;
            cursor: pointer;
            font-size: 1.5rem;
        }
        
        .notification-badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: var(--danger-color);
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
        }
        
        .admin-profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .profile-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--accent-color), #ff9900);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            font-weight: bold;
            color: var(--primary-color);
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background-color: white;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding-top: 110px;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.05);
            overflow-y: auto;
            transition: transform 0.3s ease;
            z-index: 999;
        }
        
        .sidebar-nav {
            list-style: none;
            padding: 20px 0;
        }
        
        .nav-item {
            margin-bottom: 5px;
        }
        
        .nav-link {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 25px;
            color: var(--dark-color);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 4px solid transparent;
        }
        
        .nav-link:hover {
            background-color: rgba(26, 42, 108, 0.05);
            border-left-color: var(--secondary-color);
            color: var(--primary-color);
        }
        
        .nav-link.active {
            background-color: rgba(26, 42, 108, 0.1);
            border-left-color: var(--primary-color);
            color: var(--primary-color);
            font-weight: 600;
        }
        
        .nav-link i {
            font-size: 1.2rem;
            width: 24px;
            text-align: center;
        }
        
        .nav-divider {
            height: 1px;
            background-color: #eee;
            margin: 15px 25px;
        }
        
        /* Main Content Styles */
        .main-content {
            margin-left: var(--sidebar-width);
            padding: 110px 30px 30px;
            transition: margin-left 0.3s ease;
        }
        
        /* Welcome Banner */
        .welcome-banner {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 40px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .welcome-banner h2 {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .welcome-banner p {
            opacity: 0.9;
            font-size: 1.1rem;
        }
        
        
        /* Management Sections */
        .management-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
            gap: 30px;
        }
        
        @media (max-width: 1100px) {
            .management-grid {
                grid-template-columns: 1fr;
            }
        }
        
        .management-section {
            background-color: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .section-header {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            padding: 20px 25px;
            border-bottom: 1px solid #eee;
        }
        
        .section-header h3 {
            font-size: 1.5rem;
            color: var(--primary-color);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .section-header h3 i {
            color: var(--secondary-color);
        }
        
        .section-content {
            padding: 30px;
        }
        
        /* Quick Actions */
        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .action-card {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
            transition: all 0.3s;
            cursor: pointer;
            text-decoration: none;
            color: var(--dark-color);
            display: block;
            border: 2px solid transparent;
        }
        
        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            border-color: var(--secondary-color);
            background-color: white;
        }
        
        .action-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 1.5rem;
        }
        
        .action-student .action-icon {
            background-color: rgba(40, 167, 69, 0.1);
            color: var(--success-color);
        }
        
        .action-staff .action-icon {
            background-color: rgba(220, 53, 69, 0.1);
            color: var(--danger-color);
        }
        
        .action-card h4 {
            font-size: 1.1rem;
            margin-bottom: 8px;
            color: var(--primary-color);
        }
        
        .action-card p {
            font-size: 0.9rem;
            color: #666;
        }
        
        /* Footer */
        .dashboard-footer {
            margin-top: 50px;
            padding: 20px;
            text-align: center;
            color: #666;
            font-size: 0.9rem;
            border-top: 1px solid #eee;
        }
        
        /* Mobile Menu Toggle */
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
        }
        
        /* Responsive Design */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
                padding: 110px 20px 30px;
            }
            
            .menu-toggle {
                display: block;
            }
            
            .management-grid {
                grid-template-columns: 1fr;
            }
            
        }
        
        @media (max-width: 768px) {
            .admin-header {
                padding: 15px 20px;
            }
            
            .header-title h1 {
                font-size: 1.5rem;
            }
            
            .profile-name {
                display: none;
            }
            
            
            .actions-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .welcome-banner h2 {
                font-size: 1.5rem;
            }
            
            .welcome-banner p {
                font-size: 1rem;
            }
        }
        
        @media (max-width: 576px) {
            .actions-grid {
                grid-template-columns: 1fr;
            }
            
            .section-content {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="admin-header">
        <div class="header-left">
            <button class="menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </button>
            <div class="logo">
                <i class="fas fa-graduation-cap"></i>
            </div>
            <div class="header-title">
                <h1>Academia Connect</h1>
                <p>Admin Dashboard</p>
            </div>
        </div>
        
        <div class="header-right">
            <div class="admin-profile">
                <div class="profile-avatar">A</div>
                <div class="profile-name">Admin User</div>
            </div>
        </div>
    </header>
    
    <!-- Sidebar Navigation -->
    <nav class="sidebar" id="sidebar">
        <ul class="sidebar-nav">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            
            <li class="nav-divider"></li>
            
            <li class="nav-item">
                <a href="#student" class="nav-link">
                    <i class="fas fa-user-graduate"></i>
                    <span>Student Management</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a href="#staff" class="nav-link">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <span>Staff Management</span>
                </a>
            </li>
            
            <li class="nav-divider"></li>
            <li class="nav-item">
                <a href="LogOutServlet" class="nav-link">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </nav>
    
    <!-- Main Content -->
    <main class="main-content" id="mainContent">
        <!-- Welcome Banner -->
        <div class="welcome-banner">
            <h2>Welcome to Admin Dashboard</h2>
            <p>Manage students, staff, and all academic activities from one centralized platform</p>
        </div>
         
        <!-- Student Management Section -->
        <section class="management-section" id="student">
            <div class="section-header">
                <h3><i class="fas fa-user-graduate"></i> Student Management</h3>
            </div>
            <div class="section-content">
                <p>Manage all student records, enrollments, and academic information</p>
                
                <div class="actions-grid">
                    <a href="addStudent.jsp" class="action-card action-student">
                        <div class="action-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h4>Add Student</h4>
                        <p>Register new students into the system</p>
                    </a>

                    
                    <a href="viewAllStudent.jsp" class="action-card action-student">
                        <div class="action-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h4>Manage Students</h4>
                        <p>Browse complete student database and take actions</p>
                    </a>

                </div>
            </div>
        </section>
        
        <br>
        
        <!-- Staff Management Section -->
        <section class="management-section" id="staff">
            <div class="section-header">
                <h3><i class="fas fa-chalkboard-teacher"></i> Staff Management</h3>
            </div>
            <div class="section-content">
                <p>Manage faculty, administrative staff, and support personnel</p>
                
                <div class="actions-grid">
                    <a href="addStaff.jsp" class="action-card action-staff">
                        <div class="action-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h4>Add Staff</h4>
                        <p>Register new staff members</p>
                    </a>
                  
                    
                    <a href="ViewAllStaff" class="action-card action-staff">
                        <div class="action-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h4>Manage Staff</h4>
                        <p>Browse complete staff directory and take actions</p>
                    </a>
                    
                </div>
            </div>
        </section>
        
        <!-- Footer -->
        <footer class="dashboard-footer">
            <p>Academia Connect Admin Dashboard</p>
            <p>Last login: Today at <%= new java.util.Date().toString().split(" ")[3] %></p>
        </footer>
    </main>
    
    <script>
        // Toggle sidebar on mobile
        document.getElementById('menuToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('active');
        });
        
        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', function(event) {
            const sidebar = document.getElementById('sidebar');
            const menuToggle = document.getElementById('menuToggle');
            
            if (window.innerWidth <= 992 && 
                !sidebar.contains(event.target) && 
                !menuToggle.contains(event.target) && 
                sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
            }
        });
        
        // Active link highlighting
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function(e) {
                // Remove active class from all links
                document.querySelectorAll('.nav-link').forEach(item => {
                    item.classList.remove('active');
                });
                
                // Add active class to clicked link
                this.classList.add('active');
                
                // Close sidebar on mobile after selection
                if (window.innerWidth <= 992) {
                    document.getElementById('sidebar').classList.remove('active');
                }
            });
        });
        
        // Action card hover effects
        document.querySelectorAll('.action-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });
        
        // Update time display every minute
        function updateTime() {
            const now = new Date();
            const timeString = now.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
            document.querySelector('.dashboard-footer p:nth-child(2)').innerHTML = 
                `Last login: Today at ${timeString} | System Version: 2.1.0`;
        }
        
        // Update time initially and every minute
        updateTime();
        setInterval(updateTime, 60000);
    </script>
</body>
</html>