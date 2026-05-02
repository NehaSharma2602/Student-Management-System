# Student-Management-System
A comprehensive web-based application built with Java Servlets, JSP, and Hibernate to streamline university management. It features role-based access for Admins, Staff (Faculty), and Students, allowing efficient handling of attendance, quizzes, and profiles.

🚀 Features
🔐 Admin Module
User Management: Add, Update, and Delete Staff and Students.
View Reports: Access full lists of students and faculty.
Secure Login: Role-based authentication system.

👩‍🏫 Staff (Faculty) Module
Attendance System: Mark student attendance by Branch and Semester.
Quiz Management: Add multiple-choice questions (MCQs) to the question bank.
Student Profiles: View student details and academic status.
Profile Management: Update personal details and password.

👨‍🎓 Student Module
Online Quiz System: Take subject-wise quizzes (Java, Python, etc.) with instant results.
Performance Tracking: View history of all past quiz attempts and scores.
Dashboard: View profile details and current semester info.

🛠️ Tech Stack
Backend: Java (JDK 17+), Servlets, JSP
ORM Framework: Hibernate 5.x (JPA)
Database: PostgreSQL
Frontend: HTML5, CSS3, JavaScript (JSP Standard Tag Library - JSTL)
Server: Apache Tomcat 9.0
Build Tool: Maven

⚙️ Setup & Installation
Clone the Repository

git clone(https://github.com/princedev0407/Student-Management-System.git)
Database Configuration

Create a PostgreSQL database named academia_connect (or your choice).
Update src/main/resources/META-INF/persistence.xml:
<property name="javax.persistence.jdbc.url" value="jdbc:postgresql://localhost:5432/your_database_name" />
<property name="javax.persistence.jdbc.user" value="your_postgres_user" />
<property name="javax.persistence.jdbc.password" value="your_postgres_password" />
Note: Hibernate is set to hbm2ddl.auto = update, so tables will be created automatically.
Build & Run

Import the project into Eclipse Enterprise IDE.
Right-click project -> Run As -> Maven Install.
Right-click project -> Run As -> Run on Server (Tomcat).
Access the app at: http://localhost:8080/Student-Management-System/
