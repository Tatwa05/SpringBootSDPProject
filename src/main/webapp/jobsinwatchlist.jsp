<!DOCTYPE html>
<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">

<%
	Student s = (Student) session.getAttribute("student");

	if(s==null)
	{
		response.sendRedirect("sessionexpiry");
		return;
	}

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student</title>
    <link rel="stylesheet" href="./css/studentsidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


    
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
    margin-left: 5px;
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
    margin-right: 9px;
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
    padding: 50px;
    min-height: 500vh; /* Ensure it takes at least the full viewport height */
    margin-left: 320px; /* Reserve space for sidebar */
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
    font-weight:bolder;
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

/* Dashboard Cards */

/* Button Styles */
.primary-btn, .secondary-btn {
    padding: 8px 16px; /* Reduced padding */
    font-size: 14px; /* Reduced font size */
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
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


    
        .dashboard-cards {
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .card-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
    gap: 20px;  /* Add space between cards */
}


        .card {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    padding: 20px;
    width: calc(48% - 20px);  /* Adjusted width */
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    margin-right: 20px; /* Added margin */
}

.card:last-child {
    margin-right: 0; /* No margin on the last card of the row */
}


        .card:hover {
            transform: scale(1.05);  /* Increased zoom effect */
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);  /* Enhanced shadow on hover */
        }

        .card i {
            font-size: 48px;
            margin-bottom: 15px;  /* Slightly increased space below icon */
            color: #007bff;
        }

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
        /* Main Content Section */
section.content-wrapper {
    flex: 1;
    margin-left: 250px; /* Adjust based on your sidebar width */
}

/* Jobs Section */
section.jobs-section {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* Jobs Grid Section */
section.jobs-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 20px;
}

/* Job Card Section */
section.job-card {
    background: white;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: grid;
    grid-template-columns: auto 1fr auto;
    gap: 20px;
    transition: transform 0.2s, box-shadow 0.2s;
    margin-left: -150px;
    margin-right: 90px;
}

section.job-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

/* Company Logo Section */
section.company-logo {
    width: 80px;
    height: 80px;
    background: #f0f0f0;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
}

section.company-logo i {
    font-size: 32px;
    color: #0112AC;
}

/* Job Information Section */
section.job-info {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

section.job-info .job-title {
    font-size: 1.4em;
    font-weight: 600;
    color: #2f335a;
    margin: 0 0 8px 0;
}

section.job-info .company-name {
    color: #666;
    font-size: 1.1em;
    margin: 0 0 12px 0;
}

section.job-details {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
}

section.job-details .detail-item {
    display: flex;
    align-items: center;
    gap: 6px;
    color: #555;
    font-size: 0.95em;
    background: #f8f8f8;
    padding: 6px 12px;
    border-radius: 20px;
}

section.job-details .detail-item i {
    color: #0112AC;
}

/* Actions Section */
section.job-actions {
    display: flex;
    flex-direction: column;
    gap: 10px;
    justify-content: center;
}

section.job-actions .action-btn {
    padding: 10px 24px;
    border-radius: 8px;
    font-size: 0.95em;
    cursor: pointer;
    transition: all 0.2s;
    border: none;
    font-weight: 500;
}

section.job-actions .apply-btn {
    background: #0112AC;
    color: white;
}

section.job-actions .apply-btn:hover {
    background: #000d8b;
}

section.job-actions .watchlist-btn {
    background: #f0f0f0;
    color: #0112AC;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

section.job-actions .watchlist-btn:hover {
    background: #e0e0e0;
}

section.job-actions .explore-btn {
    color: #0112AC;
    background: none;
    border: none;
    cursor: pointer;
    font-size: 0.9em;
    padding: 5px;
    display: flex;
    align-items: center;
    gap: 5px;
}

section.job-actions .explore-btn:hover {
    text-decoration: underline;
}

/* Modal Section */
section.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

section.modal-content {
    background: white;
    padding: 30px;
    border-radius: 12px;
    width: 90%;
    max-width: 600px;
    max-height: 80vh;
    overflow-y: auto;
    position: relative;
}

/* Responsive Design */
@media (max-width: 1024px) {
    section.content-wrapper {
        margin-left: 200px;
    }
}

@media (max-width: 768px) {
    section.content-wrapper {
        margin-left: 0;
    }
    
    section.job-card {
        grid-template-columns: 1fr;
        text-align: center;
    }
    
    section.company-logo {
        margin: 0 auto;
    }
    
    section.job-details {
        justify-content: center;
    }
    
    section.job-actions {
        flex-direction: row;
        justify-content: center;
    }
}

/* Full page blur styles */
        .modal-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            width: 200%;
            height: 200%;
            background-color: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            z-index: 1040;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .modal-backdrop.show {
            opacity: 1;
        }

        /* Additional custom styles for modal transitions */
        .modal-dialog {
            transition: all 0.3s ease-in-out;
            transform: scale(0.7);
        }

        .modal.fade.show .modal-dialog {
            transform: scale(1);
        }

        .modal-content {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .modal-header {
            background-color: #0112AC;
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .modal-footer .btn-primary {
            background-color: #0112AC;
            border-color: #0112AC;
        }

        .modal-footer .btn-primary:hover {
            background-color: #000d8b;
        }
        .alert {
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background-color: #dcfce7;
    border: 1px solid #86efac;
    color: #166534;
    font-size: 1rem;
}

.alert::before {
    content: '\2713'; /* Unicode for tick mark */
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    background: #86efac;
    border-radius: 50%;
    color: #166534;
    font-size: 1.2rem;
    font-weight: bold;
}
.alert.errormsg {
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background-color: #fee2e2; /* Light red background */
    border: 1px solid #f87171; /* Red border */
    color: #b91c1c; /* Dark red text */
    font-size: 1rem;
}

.alert.errormsg::before {
    content: '\2716'; /* Unicode for 'X' symbol */
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px;
    height: 24px;
    background: #f87171; /* Red background for icon */
    border-radius: 50%;
    color: #b91c1c; /* Dark red icon */
    font-size: 1.2rem;
    font-weight: bold;
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
                <button class="logout-btn" onclick="window.location.href='/student/studentlogout'">Logout</button>
            </div>
        </header>
         <c:if test="${not empty msg}">
            <div class="alert">
                <c:out value="${msg}" />
            </div>
        </c:if>
        <c:if test="${not empty nomsg}">
    		<div class="alert errormsg">
        		<c:out value="${nomsg}" />
    	</div>
</c:if>
        
         <section class="content-wrapper">
        <section class="jobs-section">
        
  
            <section class="jobs-grid">
                <!-- Job Card -->
                
                <c:forEach items="${jobslist}" var="job" >
                
                <c:if test="${job.status.equals('Watchlist')}">
                <section class="job-card">
                    <section class="company-logo">
                        <i class="fas fa-building"></i>
                    </section>
                    <section class="job-info">
                        <h3 class="job-title">${job.jobs.name}</h3>
                        <p class="company-name">${job.jobs.company}</p>
                        <section class="job-details">
                            <span class="detail-item">
                                <i class="fas fa-map-marker-alt"></i>
                                ${job.jobs.location}
                            </span>
                            <span class="detail-item">
                                <i class="fas fa-briefcase"></i>
                                ${job.jobs.etype }
                            </span>
                            <span class="detail-item">
                                <i class="fas fa-clock"></i>
                                ${job.jobs.type}
                            </span>
                            
                        </section>
                    </section>
                    <section class="job-actions">
                        <button class="action-btn apply-btn" data-apply-url="/student/applysavedjob?id=${job.id}">Apply Now</button>

                        <button class="action-btn watchlist-btn" onclick="window.location.href='/student/removejobinwatchlist?id=${job.id}'">
                            <i class="far fa-trash-alt"></i>
                            Remove
                        </button>
                        <button class="explore-btn" onclick="window.location.href='/student/jobdetails?id=${job.jobs.id}'">
    							View Details <i class="fas fa-chevron-right"></i>
						</button>


                    </section>
                </section>
                </c:if>
      
                </c:forEach>
                
                <!-- Add more job cards here -->
            </section>
        </section>
    </section>

   

        
    </div>
    
    
    <!-- Job Application Confirmation Modal -->
    <div class="modal fade" id="applyJobModal" tabindex="-1" aria-labelledby="applyJobModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="applyJobModalLabel">Confirm Job Application</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to apply for this job? <br>
                    <b style="color: red">Double check your Personal and Academic Profiles before applying as they get automatically mapped to the concerned Recruiter once you click on apply.</b>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="confirmApplyBtn">Apply</button>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    
    <script>
        // JavaScript to handle job application confirmation
        document.addEventListener('DOMContentLoaded', function() {
            let jobApplicationUrl = ''; // Global variable to store the application URL

            // Function to show the modal
            function showApplyModal(url) {
                jobApplicationUrl = url;
                const applyJobModal = new bootstrap.Modal(document.getElementById('applyJobModal'));
                applyJobModal.show();
            }

            // Modify all Apply Now buttons to use the modal
            document.querySelectorAll('.apply-btn').forEach(button => {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    const applicationUrl = this.getAttribute('data-apply-url');
                    showApplyModal(applicationUrl);
                });
            });

            // Confirm button in modal
            document.getElementById('confirmApplyBtn').addEventListener('click', function() {
                if (jobApplicationUrl) {
                    window.location.href = jobApplicationUrl;
                }
            });
        });
        
        
        

    </script>
    <!-- At the end of your body section -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

    <!-- JavaScript remains unchanged -->
</body>


    

</html>