<!DOCTYPE html>
<%@page import="com.klef.jfsd.springboot.model.Student"%>
<html lang="en">

<%
	//Student s = (Student) session.getAttribute("student");

	//if(s==null)
	//{
		//response.sendRedirect("sessionexpiry");
		//return;
	//}

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student</title>
    <link rel="stylesheet" href="./css/studentsidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
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
    </style>
</head>
<body>
    <!-- Sidebar Container and other elements remain unchanged -->
<script src="${pageContext.request.contextPath}/javascript/studentdashboard.js"></script>
<%@ include file="studentsidebar.jsp" %>
<div class="main-content">
<section class="dashboard-cards">
            <div class="card-row">
                <div class="card">
                    <i class="fas fa-briefcase"></i>
                    <h3>Available Jobs</h3>
                    <p>15</p>
                </div>
                <div class="card">
                    <i class="fas fa-file-alt"></i>
                    <h3>Applications Submitted</h3>
                    <p>42</p>
              </div>
            </div>
            <div class="card-row">
                <div class="card">
                    <i class="fas fa-user-tie"></i>
                    <h3>Interviews Scheduled</h3>
                    <p>7</p>
                </div>
                <div class="card">
                    <i class="fas fa-check-circle"></i>
                    <h3>Placements</h3>
                    <p>23</p>
                </div>
            </div>
            <div class="card-row">
                <div class="card">
                    <i class="fas fa-building"></i>
                    <h3>Recruiting Companies</h3>
                    <p>18</p>
                </div>
                <div class="card">
                    <i class="fas fa-calendar-alt"></i>
                    <h3>Upcoming Events</h3>
                    <p>3</p>
                </div>
            </div>
        </section>
        

</div>
    


    <!-- JavaScript remains unchanged -->
</body>


    

</html>