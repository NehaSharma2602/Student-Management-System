<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Staff | Academia Connect</title>
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
            --border-color: #e1e5eb;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f0f4f8 0%, #e3e9f0 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .form-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 1000px;
            overflow: hidden;
            display: flex;
        }
        
        /* Left Panel - Staff Image & Info */
        .staff-preview {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        
        .profile-image-container {
            position: relative;
            width: 180px;
            height: 180px;
            margin-bottom: 25px;
        }
        
        .profile-img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .profile-badge {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background: var(--accent-color);
            color: var(--primary-color);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            border: 3px solid white;
        }
        
        .staff-info {
            margin-top: 20px;
        }
        
        .staff-name {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 8px;
        }
        
        .staff-designation {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 5px;
        }
        
        .staff-department {
            font-size: 1rem;
            opacity: 0.8;
            background: rgba(255, 255, 255, 0.1);
            padding: 5px 15px;
            border-radius: 20px;
            display: inline-block;
            margin-top: 10px;
        }
        
        /* Right Panel - Edit Form */
        .edit-form {
            flex: 1.5;
            padding: 40px;
        }
        
        .form-header {
            margin-bottom: 30px;
        }
        
        .form-header h2 {
            color: var(--primary-color);
            font-size: 2rem;
            margin-bottom: 8px;
            position: relative;
            padding-bottom: 15px;
        }
        
        .form-header h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 4px;
            background: var(--accent-color);
            border-radius: 2px;
        }
        
        .form-header p {
            color: #666;
            font-size: 1rem;
        }
        
        /* Form Grid Layout */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 25px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .full-width {
            grid-column: span 2;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark-color);
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .required {
            color: var(--danger-color);
            font-size: 1.2rem;
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
        
        .form-control {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid var(--border-color);
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
        
        /* File Upload Styling */
        .file-upload-section {
            background: #f8f9fa;
            border: 2px dashed var(--border-color);
            border-radius: 10px;
            padding: 25px;
            text-align: center;
            margin-top: 10px;
            transition: all 0.3s;
            cursor: pointer;
        }
        
        .file-upload-section:hover {
            border-color: var(--secondary-color);
            background: rgba(45, 143, 199, 0.05);
        }
        
        .upload-icon {
            font-size: 2.5rem;
            color: var(--secondary-color);
            margin-bottom: 10px;
        }
        
        .upload-text {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 5px;
        }
        
        .upload-hint {
            color: #666;
            font-size: 0.85rem;
        }
        
        .file-input {
            display: none;
        }
        
        .current-image-note {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 15px;
            color: #666;
            font-size: 0.9rem;
        }
        
        .current-image-note i {
            color: var(--success-color);
        }
        
        /* Form Actions */
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            flex: 1;
        }
        
        .btn-update {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
        }
        
        .btn-update:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(26, 42, 108, 0.2);
        }
        
        .btn-cancel {
            background-color: #f8f9fa;
            color: var(--dark-color);
            border: 2px solid var(--border-color);
        }
        
        .btn-cancel:hover {
            background-color: #e9ecef;
            transform: translateY(-3px);
        }
        
        /* Hidden Inputs */
        .hidden-inputs {
            display: none;
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
        
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                flex-direction: column;
            }
            
            .staff-preview {
                padding: 30px;
            }
            
            .edit-form {
                padding: 30px;
            }
            
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .full-width {
                grid-column: span 1;
            }
        }
        
        @media (max-width: 576px) {
            body {
                padding: 15px;
            }
            
            .staff-preview, .edit-form {
                padding: 25px;
            }
            
            .profile-image-container {
                width: 150px;
                height: 150px;
            }
            
            .form-header h2 {
                font-size: 1.6rem;
            }
            
            .form-actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <!-- Left Panel - Staff Preview -->
        <div class="staff-preview">
            <div class="profile-image-container">
                <img src="${pageContext.request.contextPath}/images/${staff.profilePic}" 
                     alt="${staff.name}" 
                     class="profile-img"
                     onerror="this.src='https://ui-avatars.com/api/?name=${staff.name}&background=1a2a6c&color=fff&size=150'">
                <div class="profile-badge">
                    <i class="fas fa-user-edit"></i>
                </div>
            </div>
            
            <div class="staff-info">
                <div class="staff-name">${staff.name}</div>
                <div class="staff-designation">${staff.designation}</div>
                <div class="staff-department">${staff.department}</div>
            </div>
        </div>
        
        <!-- Right Panel - Edit Form -->
        <div class="edit-form">
            <div class="form-header">
                <h2>Edit Staff Details</h2>
                <p>Update staff information and profile picture</p>
            </div>
            
            <form action="UpdateStaffServlet" method="post" enctype="multipart/form-data" id="editForm">
                <!-- Hidden Fields -->
                <div class="hidden-inputs">
                    <input type="hidden" name="id" value="${staff.id}">
                    <input type="hidden" name="oldImg" value="${staff.profilePic}">
                </div>
                
                <!-- Form Fields Grid -->
                <div class="form-grid">
                    <!-- Name Field -->
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-user"></i> Full Name
                            <span class="required">*</span>
                        </label>
                        <div class="input-with-icon">
                            <i class="fas fa-user"></i>
                            <input type="text" name="name" value="${staff.name}" class="form-control" required>
                        </div>
                    </div>
                    
                    <!-- Email Field -->
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-envelope"></i> Email Address
                            <span class="required">*</span>
                        </label>
                        <div class="input-with-icon">
                            <i class="fas fa-envelope"></i>
                            <input type="email" name="email" value="${staff.email}" class="form-control" required>
                        </div>
                    </div>
                    
                    <!-- Password Field -->
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-lock"></i> Password
                            <span class="required">*</span>
                        </label>
                        <div class="input-with-icon">
                            <i class="fas fa-lock"></i>
                            <input type="text" name="password" value="${staff.password}" class="form-control" required>
                        </div>
                    </div>
                    
                    <!-- Designation Field -->
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-user-tie"></i> Designation
                        </label>
                        <div class="input-with-icon">
                            <i class="fas fa-user-tie"></i>
                            <input type="text" name="designation" value="${staff.designation}" class="form-control">
                        </div>
                    </div>
                    
                    <!-- Department Field -->
                    <div class="form-group full-width">
                        <label class="form-label">
                            <i class="fas fa-building"></i> Department
                        </label>
                        <div class="input-with-icon">
                            <i class="fas fa-building"></i>
                            <input type="text" name="department" value="${staff.department}" class="form-control">
                        </div>
                    </div>
                </div>
                
                <!-- Profile Picture Update -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-camera"></i> Update Profile Picture
                    </label>
                    
                    <div class="current-image-note">
                        <i class="fas fa-check-circle"></i>
                        <span>Current image is displayed on the left</span>
                    </div>
                    
                    <div class="file-upload-section" onclick="document.getElementById('imageInput').click()">
                        <div class="upload-icon">
                            <i class="fas fa-cloud-upload-alt"></i>
                        </div>
                        <div class="upload-text">Click to upload new image</div>
                        <div class="upload-hint">Supports JPG, PNG, GIF (Max 5MB)</div>
                        <div class="upload-hint">Optional - Keep current if unchanged</div>
                        <input type="file" name="img" id="imageInput" class="file-input" accept="image/*" onchange="showFileName(this)">
                        <div id="fileName" style="margin-top: 10px; font-size: 0.9rem; color: var(--success-color);"></div>
                    </div>
                </div>
                
                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="submit" class="btn btn-update">
                        <i class="fas fa-save"></i> Update Staff
                    </button>
                    <a href="adminDash.jsp" class="btn btn-cancel">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                </div>
                <div class="form-actions">
			<a href="adminDash.jsp" class="btn btn-back"> <i
				class="fas fa-arrow-left"></i> Back to Dashboard
			</a>
		</div>
            </form>
        </div>
    </div>
    
    <script>
        // Show selected file name
        function showFileName(input) {
            const fileNameDisplay = document.getElementById('fileName');
            if (input.files.length > 0) {
                fileNameDisplay.textContent = "Selected: " + input.files[0].name;
                fileNameDisplay.style.color = 'var(--success-color)';
            } else {
                fileNameDisplay.textContent = '';
            }
        }
        
        // Form validation
        document.getElementById('editForm').addEventListener('submit', function(e) {
            const name = document.querySelector('input[name="name"]').value.trim();
            const email = document.querySelector('input[name="email"]').value.trim();
            const password = document.querySelector('input[name="password"]').value.trim();
            const fileInput = document.getElementById('imageInput');
            
            let errors = [];
            
            if (!name) errors.push("Name is required");
            if (!email) errors.push("Email is required");
            if (!password) errors.push("Password is required");
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email && !emailRegex.test(email)) {
                errors.push("Please enter a valid email address");
            }
            
            // File validation if a file is selected
            if (fileInput.files.length > 0) {
                const file = fileInput.files[0];
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
        const fileUploadSection = document.querySelector('.file-upload-section');
        
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            fileUploadSection.addEventListener(eventName, preventDefaults, false);
        });
        
        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }
        
        ['dragenter', 'dragover'].forEach(eventName => {
            fileUploadSection.addEventListener(eventName, highlight, false);
        });
        
        ['dragleave', 'drop'].forEach(eventName => {
            fileUploadSection.addEventListener(eventName, unhighlight, false);
        });
        
        function highlight() {
            fileUploadSection.style.borderColor = 'var(--secondary-color)';
            fileUploadSection.style.backgroundColor = 'rgba(45, 143, 199, 0.1)';
        }
        
        function unhighlight() {
            fileUploadSection.style.borderColor = 'var(--border-color)';
            fileUploadSection.style.backgroundColor = '#f8f9fa';
        }
        
        fileUploadSection.addEventListener('drop', handleDrop, false);
        
        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;
            
            if (files.length > 0) {
                fileInput.files = files;
                showFileName(fileInput);
            }
        }
        
        // Add loading effect on submit
        const form = document.getElementById('editForm');
        const submitBtn = form.querySelector('.btn-update');
        
        form.addEventListener('submit', function() {
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Updating...';
            submitBtn.disabled = true;
        });
    </script>
</body>
</html>