<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Staff | Academia Connect</title>
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
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4edf5 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .container {
            width: 50%;
            max-width: 1200px;
            display: flex;
            min-height: 90vh;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            overflow: hidden;
        }
        
        .right-panel {
            flex: 1.2;
            background-color: white;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .form-header {
            margin-bottom: 40px;
        }
        
        .form-header h2 {
            font-size: 2.2rem;
            color: var(--primary-color);
            margin-bottom: 10px;
            position: relative;
            padding-bottom: 15px;
        }
        
        .form-header h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 70px;
            height: 4px;
            background-color: var(--accent-color);
            border-radius: 2px;
        }
        
        .form-header p {
            color: #666;
            font-size: 1.1rem;
        }
        
        /* Form Styles */
        .staff-form {
            width: 100%;
        }
        
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark-color);
            font-size: 1rem;
        }
        
        .required {
            color: var(--danger-color);
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
            font-size: 1.1rem;
        }
        
        .form-control {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #e1e5eb;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s;
            background-color: #f8f9fa;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--secondary-color);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(45, 143, 199, 0.1);
        }
        
        .select-control {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5eb;
            border-radius: 10px;
            font-size: 1rem;
            background-color: #f8f9fa;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .select-control:focus {
            outline: none;
            border-color: var(--secondary-color);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(45, 143, 199, 0.1);
        }
        
        /* File Upload Styling */
        .file-upload-container {
            border: 2px dashed #e1e5eb;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            background-color: #f8f9fa;
            transition: all 0.3s;
            cursor: pointer;
        }
        
        .file-upload-container:hover {
            border-color: var(--secondary-color);
            background-color: rgba(45, 143, 199, 0.05);
        }
        
        .file-upload-container i {
            font-size: 3rem;
            color: var(--secondary-color);
            margin-bottom: 15px;
        }
        
        .file-upload-label {
            display: block;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 10px;
            font-size: 1.1rem;
        }
        
        .file-upload-hint {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }
        
        .file-input {
            width: 0.1px;
            height: 0.1px;
            opacity: 0;
            overflow: hidden;
            position: absolute;
            z-index: -1;
        }
        
        .file-name {
            margin-top: 10px;
            font-size: 0.9rem;
            color: var(--success-color);
            font-weight: 500;
        }
        
        /* Button Styles */
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
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
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
        
        /* Message Styles */
        .message-container {
            margin-top: 25px;
        }
        
        .message {
            padding: 15px;
            border-radius: 10px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .error {
            background-color: rgba(220, 53, 69, 0.1);
            color: var(--danger-color);
            border: 1px solid rgba(220, 53, 69, 0.2);
        }
        
        .success {
            background-color: rgba(40, 167, 69, 0.1);
            color: var(--success-color);
            border: 1px solid rgba(40, 167, 69, 0.2);
        }
        
        /* Responsive Design */
        @media (max-width: 992px) {
            .container {
                flex-direction: column;
                min-height: auto;
            }
            
            .left-panel {
                padding: 40px;
            }
            
            .right-panel {
                padding: 40px;
            }
            
            .info-section h2 {
                font-size: 1.8rem;
            }
        }
        
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }
            
            .left-panel, .right-panel {
                padding: 30px;
            }
            
            .form-header h2 {
                font-size: 1.8rem;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
            
            .logo-text h1 {
                font-size: 1.6rem;
            }
        }
        
        @media (max-width: 576px) {
            .left-panel, .right-panel {
                padding: 25px;
            }
            
            .info-section h2 {
                font-size: 1.6rem;
            }
            
            .form-header h2 {
                font-size: 1.6rem;
            }
            
            .file-upload-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Right Panel - Form -->
        <div class="right-panel">
            <div class="form-header">
                <h2>Add New Staff</h2>
                <p>Please fill in all required fields to register a new staff member</p>
            </div>
            
            <form action="add_staff" method="post" enctype="multipart/form-data" class="staff-form" id="staffForm">
                <!-- Name Field -->
                <div class="form-group">
                    <label class="form-label">Staff Name <span class="required">*</span></label>
                    <div class="input-with-icon">
                        <i class="fas fa-user"></i>
                        <input type="text" name="name" class="form-control" placeholder="Enter full name" required>
                    </div>
                </div>
                
                <!-- Email Field -->
                <div class="form-group">
                    <label class="form-label">Email Address <span class="required">*</span></label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="email" name="email" class="form-control" placeholder="Enter email address" required>
                    </div>
                </div>
                
                <!-- Password Field -->
                <div class="form-group">
                    <label class="form-label">Password <span class="required">*</span></label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <input type="text" name="password" class="form-control" placeholder="Create a password" required>
                    </div>
                    <small style="color: #666; display: block; margin-top: 5px;">Default password can be changed later by the staff member</small>
                </div>
                
                <!-- Designation Field -->
                <div class="form-group">
                    <label class="form-label">Designation <span class="required">*</span></label>
                    <select name="designation" class="select-control" required>
                        <option value="" disabled selected>Select designation</option>
                        <option value="Professor">Professor</option>
                        <option value="Assistant Professor">Assistant Professor</option>
                        <option value="Associate Professor">Associate Professor</option>
                        <option value="Lecturer">Lecturer</option>
                        <option value="Lab Assistant">Lab Assistant</option>
                        <option value="Administrative Staff">Administrative Staff</option>
                        <option value="Technical Staff">Technical Staff</option>
                        <option value="Support Staff">Support Staff</option>
                    </select>
                </div>
                
                <!-- Department Field -->
                <div class="form-group">
                    <label class="form-label">Department <span class="required">*</span></label>
                    <select name="department" class="select-control" required>
                        <option value="" disabled selected>Select department</option>
                        <option value="CSE">Computer Science And Engineering</option>
                        <option value="IT">Information Technology</option>
                        <option value="ECE">Electronics And Communication Engineering</option>
                        <option value="EEE">Electrical And Electronics Engineering</option>
                        <option value="ME">Mechanical Engineering</option>
                        <option value="CE">Civil Engineering</option>
                        <option value="CHE">Chemical Engineering</option>
                        <option value="AE">Automobile Engineering</option>
                        <option value="ARCH">Architecture</option>
                        <option value="MBA">Management Studies</option>
                        <option value="SCI">Applied Sciences</option>
                        <option value="ADMIN">Administration</option>
                    </select>
                </div>
                
                <!-- Profile Picture Field -->
                <div class="form-group">
                    <label class="form-label">Profile Picture <span class="required">*</span></label>
                    <div class="file-upload-container" onclick="document.getElementById('fileInput').click()">
                        <i class="fas fa-cloud-upload-alt"></i>
                        <div class="file-upload-label">Upload Profile Photo</div>
                        <div class="file-upload-hint">Click to browse or drag and drop</div>
                        <div class="file-upload-hint">Maximum file size: 5MB</div>
                        <div class="file-name" id="fileName">No file chosen</div>
                        <input type="file" name="img" id="fileInput" class="file-input" accept="image/*" required onchange="updateFileName(this)">
                    </div>
                </div>
                
                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="submit" class="btn btn-submit">
                        <i class="fas fa-user-plus"></i> Register Staff
                    </button>
                    <a href="adminDash.jsp" class="btn btn-back">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
            </form>
            
            <!-- Message Display -->
            <div class="message-container">
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
    </div>
    
    <script>
        // Update file name display
        function updateFileName(input) {
            const fileNameDisplay = document.getElementById('fileName');
            if (input.files.length > 0) {
                fileNameDisplay.textContent = input.files[0].name;
                fileNameDisplay.style.color = 'var(--success-color)';
            } else {
                fileNameDisplay.textContent = 'No file chosen';
                fileNameDisplay.style.color = '#666';
            }
        }
        
        // Form validation
        document.getElementById('staffForm').addEventListener('submit', function(e) {
            const name = document.querySelector('input[name="name"]').value.trim();
            const email = document.querySelector('input[name="email"]').value.trim();
            const password = document.querySelector('input[name="password"]').value.trim();
            const designation = document.querySelector('select[name="designation"]').value;
            const department = document.querySelector('select[name="department"]').value;
            const file = document.querySelector('input[name="img"]').files[0];
            
            let errors = [];
            
            if (!name) errors.push("Name is required");
            if (!email) errors.push("Email is required");
            if (!password) errors.push("Password is required");
            if (!designation) errors.push("Please select a designation");
            if (!department) errors.push("Please select a department");
            if (!file) errors.push("Profile picture is required");
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email && !emailRegex.test(email)) {
                errors.push("Please enter a valid email address");
            }
            
            // File type validation
            if (file) {
                const allowedTypes = ['image/jpeg', 'image/png', 'image/jpg', 'image/gif'];
                if (!allowedTypes.includes(file.type)) {
                    errors.push("Please upload an image file (JPEG, PNG, GIF)");
                }
                
                // File size validation (5MB)
                if (file.size > 5 * 1024 * 1024) {
                    errors.push("File size should be less than 5MB");
                }
            }
            
            if (errors.length > 0) {
                e.preventDefault();
                alert("Please fix the following errors:\n\n" + errors.join("\n"));
            }
        });
        
        // Add drag and drop functionality
        const fileUploadContainer = document.querySelector('.file-upload-container');
        
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            fileUploadContainer.addEventListener(eventName, preventDefaults, false);
        });
        
        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }
        
        ['dragenter', 'dragover'].forEach(eventName => {
            fileUploadContainer.addEventListener(eventName, highlight, false);
        });
        
        ['dragleave', 'drop'].forEach(eventName => {
            fileUploadContainer.addEventListener(eventName, unhighlight, false);
        });
        
        function highlight() {
            fileUploadContainer.style.borderColor = 'var(--secondary-color)';
            fileUploadContainer.style.backgroundColor = 'rgba(45, 143, 199, 0.1)';
        }
        
        function unhighlight() {
            fileUploadContainer.style.borderColor = '#e1e5eb';
            fileUploadContainer.style.backgroundColor = '#f8f9fa';
        }
        
        fileUploadContainer.addEventListener('drop', handleDrop, false);
        
        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;
            const fileInput = document.getElementById('fileInput');
            
            if (files.length > 0) {
                fileInput.files = files;
                updateFileName(fileInput);
            }
        }
    </script>
</body>
</html>