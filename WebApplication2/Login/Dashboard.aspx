<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication2.Login.Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Admin Dashboard</title>
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

        /* Cards */
        .cards-container {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            border: 1px solid #ddd;
            padding: 20px;
            background-color: white;
            width: 200px;
            text-align: center;
        }

        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }

        /* Analytics Section */
        .analytics {
            margin-top: 40px;
        }

        .analytics h3 {
            font-size: 22px;
            margin-bottom: 20px;
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
                <h3>Admin Dashboard</h3>
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
            
            <!-- Main Dashboard Content -->
            <div class="dashboard">
                <h2>Dashboard Overview</h2>
                <div class="cards-container">
                    <div class="card">
                        <h3>Total Users</h3>
                        <p>1,500</p>
                    </div>
                    <div class="card">
                        <h3>New Posts</h3>
                        <p>120</p>
                    </div>
                    <div class="card">
                        <h3>Revenue</h3>
                        <p>$10,230</p>
                    </div>
                    <div class="card">
                        <h3>Active Sessions</h3>
                        <p>350</p>
                    </div>
                </div>

                <div class="analytics">
                    <h3>User Activity</h3>
                    <canvas id="userActivityChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Toggle Sidebar
        document.getElementById("sidebarCollapse").addEventListener("click", function () {
            document.getElementById("sidebar").classList.toggle("active");
        });

        // Chart Example - User Activity
        var ctx = document.getElementById('userActivityChart').getContext('2d');
        var userActivityChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                    label: 'Users Active per Day',
                    data: [120, 190, 300, 500, 200, 300, 400],
                    backgroundColor: 'rgba(0, 123, 255, 0.2)',
                    borderColor: 'rgba(0, 123, 255, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true
            }
        });
    </script>
</body>
</html>
