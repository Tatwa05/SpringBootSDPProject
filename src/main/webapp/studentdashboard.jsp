<!DOCTYPE html>
<%@page import="com.klef.jfsd.springboot.model.Student"%>
<html lang="en">
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
	Student s = (Student) session.getAttribute("student");

	if(s==null)
	{
		response.sendRedirect("sessionexpiry");
		return;
	}
	else if(s.getStatus().equals("Blocked"))
	{
		response.sendRedirect("sblocked");
		return;
	}

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - CareerStream</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
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
    margin-left: 310px; /* Reserve space for sidebar */
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
    
        :root {
            --primary-blue: #3b82f6;
            --primary-green: #10b981;
            --primary-purple: #8b5cf6;
            --primary-orange: #f97316;
            --primary-pink: #ec4899;
            --primary-teal: #14b8a6;
            
            --background-light: #f3f4f6;
            --text-dark: #1f2937;
            --text-muted: #6b7280;
            --white: #ffffff;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background-light);
            color: var(--text-dark);
        }

        .main-content {
            background-color: var(--white);
            margin-left: 290px;
            margin-top : 10px;
            padding: 30px;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid var(--background-light);
            padding-bottom: 10px;
            margin-bottom: 30px;
        }

        header h1 {
            color: #2c3e50;
            font-weight: 700;
            font-size: 1.8rem;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info span {
            margin-right: 15px;
            color: var(--text-muted);
            font-weight: 500;
        }

        .logout-btn {
            background-color: ;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #2563eb;
        }

       .dashboard-cards {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 25px;
    padding: 20px;
    margin-top: 5px;
}

.card {
    background-color: var(--white);
    border-radius: 15px;
    box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
    padding: 30px;
    text-align: center;
    transition: all 0.4s ease-in-out;
    position: relative;
    overflow: hidden;
    border: none;
    transform-style: preserve-3d;
    perspective: 1000px;
    height: 200px;
}

.card::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 160%;
    height:130%;
    background: radial-gradient(circle at center, rgba(255,255,255,0.1) 0%, transparent 70%);
    opacity: 0.5;
    z-index: 1;
    transition: all 0.3s ease;
}

.card:hover {
    transform: translateY(-15px) rotateX(5deg);
    box-shadow: 0 20px 45px rgba(0,0,0,0.15);
}

.card:hover::before {
    opacity: 0.8;
}

.card-icon {
    font-size: 49px;
    margin-bottom: 20px;
    position: relative;
    z-index: 2;
    transition: transform 0.3s ease;
    opacity: 0.9;
}

.card:hover .card-icon {
    transform: scale(1.1) rotate(5deg);
    opacity: 1;
}

.card-jobs .card-icon { color: var(--primary-orange); }
.card-applications .card-icon { color: var(--primary-purple); }
.card-interviews .card-icon {
    color: #007b83; /* A deeper teal shade for interviews */
}

.card-placements .card-icon {
    color: #28a745; /* A vivid green shade for placements */
}


.card-companies .card-icon { color: var(--primary-blue); }
.card-events .card-icon { color: var(--primary-pink); }

.card h3 {
    margin-bottom: 15px;
    color: var(--text-dark);
    font-weight: 600;
    font-size: 1.2rem;
    letter-spacing: 0.5px;
    position: relative;
    z-index: 2;
    transition: color 0.3s ease;
}

.card:hover h3 {
    color: rgba(0,0,0,0.7);
}

.card p {
    font-size: 2rem;
    font-weight: 700;
    position: relative;
    z-index: 2;
    transition: transform 0.3s ease;
}

.card:hover p {
    transform: scale(1.05);
}

.card-jobs p { color: var(--primary-orange); }
.card-applications p { color: var(--primary-purple); }
.card-interviews  p{
    color: #007b83; /* A deeper teal shade for interviews */
}

.card-placements  p{
    color: #28a745; /* A vivid green shade for placements */
}

.card-companies p { color: var(--primary-blue); }
.card-events p { color: var(--primary-pink); }

.card::after {
    content: '';
    position: absolute;
    bottom: -100%;
    left: 0;
    width: 100%;
    height: 5px;
    transition: bottom 0.3s ease;
}

.card:hover::after {
    bottom: 0;
}

.card-jobs::after { background: var(--primary-orange); }
.card-applications::after { background: var(--primary-purple); }
.card-interviews::after { background: var(--primary-teal); }
.card-placements::after { background: var(--primary-green); }
.card-companies::after { background: var(--primary-blue); }
.card-events::after { background: var(--primary-pink); }

@media (max-width: 1200px) {
    .dashboard-cards {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 768px) {
    .dashboard-cards {
        grid-template-columns: repeat(2, 1fr);
        gap: 15px;
        padding: 10px;
    }

    .card {
        padding: 20px;
    }

    .card-icon {
        font-size: 42px;
    }
}

@media (max-width: 480px) {
    .dashboard-cards {
        grid-template-columns: 1fr;
    }
}
        
    </style>
</head>
<body>
    <!-- Sidebar Container (Kept exactly the same as original) -->
    <script src="${pageContext.request.contextPath}/javascript/studentdashboard.js"></script>
    <div class="sidebar-container">
        <div class="menu-icon">
            <i class="fas fa-bars" onclick="toggleSidebar()"></i>
        </div>

        <div class="sidebar">
            <div class="sidebar-header"><br><br>
                <h2>Hello <%= s.getId() %> </h2>
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
        
        <section class="dashboard-cards">
            <div class="card card-jobs">
                <i class="card-icon bi bi-briefcase-fill"></i>
                <h3>Available Jobs</h3>
                <p>${acnt}</p>
            </div>
            <div class="card card-applications">
                <i class="card-icon bi bi-file-earmark-text-fill"></i>
                <h3>Applications Submitted</h3>
                <p>${appcnt}</p>
            </div>
            <div class="card card-interviews">
                <i class="card-icon bi bi-person-workspace"></i>
                <h3>Interviews Scheduled</h3>
                <p>${intcnt}</p>
            </div>
            <div class="card card-placements">
                <i class="card-icon bi bi-patch-check-fill"></i>
                <h3>Placements</h3>
                <p>${scnt}</p>
            </div>
            <div class="card card-companies">
                <i class="card-icon bi bi-buildings-fill"></i>
                <h3>Recruiting Companies</h3>
                <p>${companies}</p>
            </div>
            <div class="card card-events">
               <i class=" card-icon bi bi-star-fill"></i>


                <h3>Applications Shortlisted</h3>
                <p>${shortcnt}</p>
            </div>
        </section>
    </div>

    
    

<script src="${pageContext.request.contextPath}/JavaScript/studentdashboard.js"></script>


</body>
</html>