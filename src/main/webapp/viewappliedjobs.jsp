<!DOCTYPE html>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.model.Student, com.klef.jfsd.springboot.controller.StudentController"%>

<%
	Student s = (Student) session.getAttribute("student");

	if(s==null)
	{
		response.sendRedirect("sessionexpiry");
		return;
	}
%>

<html lang="en">



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student</title>
    <link rel="stylesheet" href="./css/studentsidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
    @charset "UTF-8";

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'poppins', sans-serif;
}

body {
    font-family: 'Poppins', sans-serif;
    display: flex;
    height: 100vh;
    background-color: #f5f5f5;
    overflow-x: hidden;
    position: relative;
}

/* Menu Icon (Hamburger) */
.menu-icon {
    position: fixed;
    top: 20px;
    left: 20px;
    font-size: 30px;
    cursor: pointer;
    color: gray;
    z-index: 1000; /* Ensure icon is on top */
}

/* Sidebar Styles */
.sidebar {
    width: 290px;
    background-color: #2f335a;
    padding: 20px;
    color: white;
    position: fixed;
    left: -290px; /* Initially hidden */
    top: 0;
    height: 100%;
    transition: left 0.3s ease;
    z-index: 900; /* Above content */
    overflow-y: auto; /* Scroll if content exceeds */
}

.sidebar.active {
    left: 0;
}

.sidebar-header {
    margin-bottom: 20px;
    font-family: 'Poppins', sans-serif;
}

.sidebar h2 {
    font-size: 22px;
    color: #ffffff;
    font-family: 'Poppins', sans-serif;
}

.sidebar ul {
    list-style: none;
}

.sidebar ul li {
    margin-bottom: 15px;
}

.sidebar ul li a {
    color: #eaeaea;
    text-decoration: none;
    font-size: 16px;
    display: flex;
    align-items: center;
    padding: 10px;
    border-radius: 5px;
    transition: background 0.3s, color 0.3s;
    font-family: 'Poppins', sans-serif;
}

.sidebar ul li a:hover {
    background-color: #7f8996;
    color: #ffffff;
}

.sidebar ul li a i {
    margin-right: 10px;
}

/* Dropdown Arrow Styling */
.arrow {
    margin-left: auto;
    transition: transform 0.3s ease;
}

/* Dropdown Styles */
.dropdown-content {
    display: none;
    list-style: none;
    padding-left: 20px;
    background-color: #7f8996;
    margin-top: 10px;
    border-radius: 5px;
    overflow: hidden;
    max-height: 0;
    transition: max-height 0.3s ease-in-out;
    font-family: 'Poppins', sans-serif;
}

.dropdown-content li {
    margin: 5px 0;
    font-family: 'Poppins', sans-serif;
}

.dropdown-content li a {
    color: #eaeaea;
    text-decoration: none;
    font-size: 14px;
    display: flex;
    align-items: center;
    padding: 8px 15px;
    border-radius: 5px;
    transition: background 0.3s;
    font-family: 'Poppins', sans-serif;
}

.dropdown-content li a:hover {
    background-color: #0112AC;
}

.show {
    display: block;
    max-height: 300px;
}

/* Main Content Styles */
.container {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    transition: margin-left 0.3s ease;
    margin-left: 0;
}

.sidebar.active ~ .container {
    margin-left: 250px; /* Adjust for sidebar */
}

.main-content {
    padding: 20px;
    margin-left: 290px; /* Reserve space for sidebar */
    margin-top: 50px; /* Space for header */
    transition: margin-left 0.3s ease;
    flex-grow: 1;
    background-color: #ecf0f1;
    border-radius: 10px;
}

/* Adjustments for when the sidebar is active */
.sidebar.active ~ .main-content {
    margin-left: 0;
}

/* Header Styles */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #ffffff;
    padding: 10px 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    border-radius: 10px;
}

header h1 {
    font-size: 24px;
    color: #2c3e50;
    font-family: 'Poppins', sans-serif;
}

.user-info {
    display: flex;
    align-items: center;
    font-family: 'Poppins', sans-serif;
}

.user-info span {
    margin-right: 20px;
    font-size: 18px;
    font-family: 'Poppins', sans-serif;
}

.logout-btn {
    padding: 8px 16px;
    background-color: #e74c3c;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-family: 'Poppins', sans-serif;
}

.logout-btn:hover {
    background-color: #c0392b;
}


.primary-btn {
    background-color: #ffffff;
    color: #0112AC;
    border: 1px solid #0112AC;
}

.primary-btn:hover {
    background-color: #e0e0e0;
}

.secondary-btn {
    background-color: #f0f0f0;
    color: #0112AC;
    border: 1px solid #b0b0b0;
}

.secondary-btn:hover {
    background-color: #c1c1c1;
}

/* Media Queries for Responsiveness */
@media screen and (max-width: 768px) {
    .sidebar {
        width: 100%;
        left: -100%;
    }

    .sidebar.active {
        left: 0;
    }

    .container, .main-content {
        margin-left: 0;
    }

    .dashboard-cards {
        flex-direction: column; /* Ensure cards stack vertically on small screens */
        gap: 10px; /* Reduced gap for small screens */
    }

    .card {
        min-width: unset; /* Remove minimum width for smaller screens */
    }
}

/* General styles */
body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: 'Poppins', sans-serif;
    background-color: #f4f6f9;
    font-family: 'Poppins', sans-serif;
}

.login-page {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: #f4f6f9;
}

.login-box {
    background-color: white;
    padding: 40px;
    width: 400px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.logo h1 {
    font-size: 2em;
    color: #0112AC; /* Primary color */
    margin-bottom: 40px;
}

.input-group {
    margin-bottom: 20px;
    text-align: left;
}

.input-group label {
    font-weight: 600;
    font-size: 0.9em;
    color: #333;
}

.input-group input {
    width: 100%;
    padding: 12px 15px;
    font-size: 1em;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f7f9fc;
}

.input-group input:focus {
    border-color: #0112AC;
    outline: none;
    background-color: #fff;
}

.login-btn {
    width: 100%;
    padding: 15px;
    font-size: 1em;
    background-color: #0112AC;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 600;
}

.login-btn:hover {
    background-color: #0b5ed7;
}

.login-box form {
    width: 100%;
}

/* Admin Login  */


    
        .card h3 {
            margin-bottom: 15px;  /* Slightly increased space below title */
            color: #333;
        }

        .card p {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }

        @media (max-width: 768px) {
            .card-row {
                flex-direction: column;
            }
            .card {
                width: 60%;
                margin-bottom: 90px;  /* Increased space between cards on mobile */
            }
        }
         .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .status-pending {
            background-color: #ffc107;
            color: #212529;
        }
        
        .status-interview {
            background-color: #262dc3;
            color: white;
        }

        .status-accepted {
            background-color: #28a745;
            color: white;
        }

        .status-rejected {
            background-color: #dc3545;
            color: white;
        }
        .status-shortlisted {
    background-color: #dcfce7;
    color: #166534;
}
    </style>
</head>
<body>
    <!-- Sidebar Container and other elements remain unchanged -->
<script src="${pageContext.request.contextPath}/javascript/studentdashboard.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/studentdashboard.js"></script>


    <!-- Sidebar Container -->
    <div class="sidebar-container">
        <!-- Menu Icon (Hamburger) -->
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleSidebar()"></i>
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header"><br><br>
                <h2>Hello <%= s.getId() %></h2> <!-- Updated Heading -->
            </div>
            <ul>
     <li><a href="studentdashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="applyjobs"><i class="fas fa-briefcase"></i> Apply for jobs</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn" onclick="toggleDropdown('students')">
                        <i class="fas fa-eye"></i> View
                        <span class="arrow">&#9662;</span>
                    </a>
                    <ul class="dropdown-content" id="students-dropdown">
                        <li><a href="viewappliedjobs"><i class="fas fa-tachometer-alt"></i> Applied Jobs</a></li>
                        <li><a href="getjobsinwatchlist"><i class="fas fa-bars"></i> Watchlist</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-btn" onclick="toggleDropdown('employers')">
                        <i class="fas fa-user-edit"></i> Profile
                        <span class="arrow">&#9662;</span>
                    </a>
                    <ul class="dropdown-content" id="employers-dropdown">
                        <li><a href="studentprofile"><i class="fas fa-user-circle"></i> Personal Details</a></li>
                        <li><a href="educationdetails"><i class="fas fa-id-card" > </i> Academic Details</a></li>
                        <li><a href="studentdocuments"><i class="fas fa-file-pdf"></i> Documents Uploaded</a></li>

                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-content">
        <header>
            <h1>CareerStream</h1>
            <div class="user-info">
                <span><%= s.getName() %></span>
                <button class="logout-btn" onclick="window.location.href='studentlogout'">Logout</button>
            </div>
        </header>
        
        <section class="view-appliedjobs">
    <div class="custom-table-container">
        <div class="table-header">
            <h2 class="mb-4 section-title">Applied Jobs Status</h2>
            <br/>
            <div class="d-flex justify-content-between align-items-center mb-4">
                
                <div class="filter-buttons">
                    <button class="btn primary-btn" onclick="window.location.href='/student/viewappliedjobs'" >All</button>
                    <button class="btn btn-outline-secondary" onclick="window.location.href='/student/getstatus/<%= s.getId() %>/APPLIED'">Pending</button>
					<button class="btn btn-outline-secondary" onclick="window.location.href='/student/getstatus/<%= s.getId() %>/Shortlisted'">Shortlisted</button>
					<button class="btn btn-outline-secondary" onclick="window.location.href='/student/getstatus/<%= s.getId() %>/Rejected'">Rejected</button>

                </div>
            </div>
        </div>
        
        <br/>

        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                    	<th>Student ID</th>
                        <th class="rounded-start">Company</th>
                        <th>Location</th>
                        <th>Position</th>
                 		<th>Employement Type</th>
                        <th>Status</th>
                   
                        
                    </tr>
                </thead>
                
                
                
                
                <tbody>
                <c:forEach items="${jobslist}" var="jobs">
                <c:if test="${jobs.status!='Watchlist'}">
                    <tr class="align-middle">
                    	<td>
                            <div class="d-flex align-items-center">
                                
                                <div>
                                    ${jobs.student.id}
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                                
                                <div>
                                   ${jobs.jobs.company }
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                                
                                <div>
                                  ${jobs.jobs.location}
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                                
                                <div>
                                  ${jobs.jobs.name}
                                </div>
                            </div>
                        </td>
                        
                                    
                        
                        
                        <td>
                            <div class="d-flex align-items-center">
                                
                                <div>
                                  ${jobs.jobs.etype}
                                </div>
                            </div>
                        </td>
                        
                     
                            <td>
    							<c:choose>
        								<c:when test="${jobs.status == 'APPLIED'}">
								            <span class="status-badge status-pending">${jobs.status}</span>
								        </c:when>
								        <c:when test="${jobs.status == 'Interview'}">
								            <span class="status-badge status-interview">${jobs.status}</span>
								        </c:when>
								        <c:when test="${jobs.status == 'Shortlisted'}">
								            <span class="status-badge status-shortlisted">${jobs.status}</span>
								        </c:when>
								        <c:when test="${jobs.status == 'Selected'}">
								            <span class="status-badge status-accepted">${jobs.status}</span>
								        </c:when>
								        <c:otherwise>
								            <span class="status-badge status-rejected">${jobs.status}</span>
								        </c:otherwise>
								</c:choose>
						</td>

                        
                    </tr>
                    </c:if>
                    </c:forEach>
                    
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        
    </div>
</section>

<style>
/* Base styles */
.section-title {
    color: #2f335a;
    font-weight: 600;
}

.custom-table-container {
    background: #fff;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Search box styles */
.search-box .form-control {
    border-radius: 20px;
    padding: 10px 20px;
    width: 300px;
    border: 1px solid #e0e0e0;
}

/* Filter buttons */
.filter-buttons {
    display: flex;
    gap: 10px;
}

.filter-buttons .btn {
    padding: 8px 20px;
    border-radius: 20px;
    font-size: 0.9rem;
    transition: all 0.3s ease;
}

.filter-buttons .btn:hover {
    transform: translateY(-1px);
}

.primary-btn {
    background: #2f335a;
    color: white;
}

/* Table styles */
.table {
    border-collapse: separate;
    border-spacing: 0 15px;
    margin-left: 121px;
}

.table thead tr {
    background: linear-gradient(45deg, #2f335a, #3b82f6);
    color: white;
}

.table thead tr th {
    border: none;
    padding: 15px;
    font-weight: 400;
    font-size: 0.9rem;
}

.table tbody tr {
    background: white;
    margin-bottom: 10px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.table tbody tr:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table tbody td {
    border: none;
    padding: 15px;
    vertical-align: middle;
    font-size: 0.99rem;
}

/* Company logo styles */
.company-logo {
    width: 40px;
    height: 40px;
    background: #f8f9fa;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 1rem;
}

.company-logo span {
    font-size: 20px;
}

/* Status badge styles */
.badge {
    padding: 8px 12px;
    border-radius: 20px;
}

.status-shortlisted {
    background-color: #dcfce7;
    color: #166534;
}

.status-pending {
    background-color: #fef3c7;
    color: #92400e;
}

.status-rejected {
    background-color: #fee2e2;
    color: #991b1b;
    
}

/* Button group styles */
.btn-group .btn {
    padding: 5px 15px;
    font-size: 0.76rem;
}

/* Pagination styles */

/* Responsive styles */
@media (max-width: 768px) {
    .filter-buttons {
        flex-wrap: wrap;
    }
    
    .search-box {
        margin-bottom: 15px;
    }
    
    .table-responsive {
        overflow-x: auto;
    }

    .search-box .form-control {
        width: 100%;
    }
}
</style>
   
    
    </div>

    <!-- JavaScript remains unchanged -->
</body>


    

</html>