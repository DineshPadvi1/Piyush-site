<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analytics.aspx.cs" Inherits="WebApplication2.Login.Analytics" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Analytics</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- For Charts -->
    <style>
        /* General Layout */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .wrapper {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }

        #content {
            width: 100%;
            padding: 20px;
            background-color: #ffffff;
            transition: all 0.3s;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            background-color: #007bff;
            padding: 10px;
        }

        .navbar h2 {
            color: #ffffff;
            font-size: 24px;
        }

        .navbar .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        /* Sidebar */
        #sidebar {
            background-color: #343a40;
            color: white;
            width: 250px;
            padding: 20px;
            min-height: 100vh;
            transition: all 0.3s;
        }

        #sidebar .sidebar-header {
            padding: 10px 0;
            background-color: #212529;
            text-align: center;
        }

        #sidebar h3 {
            color: white;
            font-size: 24px;
        }

        #sidebar ul.components {
            padding: 0;
            list-style: none;
        }

        #sidebar ul li {
            padding: 15px;
            border-bottom: 1px solid #474f54;
        }

        #sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
        }

        #sidebar ul li:hover {
            background-color: #495057;
        }

        /* Analytics Charts */
        .analytics {
            margin-top: 20px;
        }

        .analytics h3 {
            font-size: 22px;
            margin-bottom: 20px;
        }

        canvas {
            max-width: 100%;
            height: auto;
        }

        /* Toggle Sidebar Button */
        #sidebarCollapse {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-bottom: 20px;
        }

        #sidebar.active {
            margin-left: -250px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Analytics</h3>
            </div>
            <ul class="list-unstyled components">
                <p>Welcome, Admin</p>
                <li><a href="Dashboard.aspx">Dashboard</a></li>
                <li><a href="UserManagement.aspx">User Management</a></li>
                <li><a href="ContentManagement.aspx">Content Management</a></li>
                <li><a href="Analytics.aspx">Analytics</a></li>
                <li><a href="Settings.aspx">Settings</a></li>
                <li><a href="Logs.aspx">Activity Logs</a></li>
                <li><a href="Logout.aspx">Logout</a></li>
            </ul>
        </nav>

        <!-- Page Content -->
        <div id="content">
            <div class="navbar">
                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i> Toggle Sidebar
                </button>
            </div>
            
            <!-- Main Analytics Content -->
            <div class="analytics">
                <h2>Analytics Overview</h2>
                <div>
                    <h3>User Signups Over Time</h3>
                    <canvas id="signupChart"></canvas>
                </div>
                <div>
                    <h3>Page Views</h3>
                    <canvas id="pageViewsChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Toggle Sidebar
        document.getElementById("sidebarCollapse").addEventListener("click", function () {
            document.getElementById("sidebar").classList.toggle("active");
        });

        // Chart.js Charts
        var ctx1 = document.getElementById('signupChart').getContext('2d');
        var signupChart = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                datasets: [{
                    label: 'User Signups',
                    data: [50, 75, 150, 100, 200, 250, 300],
                    backgroundColor: 'rgba(0, 123, 255, 0.6)',
                }]
            },
            options: {
                responsive: true
            }
        });

        var ctx2 = document.getElementById('pageViewsChart').getContext('2d');
        var pageViewsChart = new Chart(ctx2, {
            type: 'line',
            data: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                datasets: [{
                    label: 'Page Views',
                    data: [1000, 1500, 2000, 2500],
                    backgroundColor: 'rgba(40, 167, 69, 0.6)',
                    borderColor: 'rgba(40, 167, 69, 1)',
                    fill: false
                }]
            },
            options: {
                responsive: true
            }
        });
    </script>
</body>
</html>
