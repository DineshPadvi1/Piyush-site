<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logs.aspx.cs" Inherits="WebApplication2.Login.Logs" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Activity Logs</title>
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

        /* Logs Table */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f8f9fa;
            color: #343a40;
        }

        table tr:hover {
            background-color: #f1f1f1;
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
                <h3>Activity Logs</h3>
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
            
            <!-- Main Logs Content -->
            <div class="dashboard">
                <h2>System Activity Logs</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Date/Time</th>
                            <th>User</th>
                            <th>Action</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample Log Entries -->
                        <tr>
                            <td>01/01/2023 10:00 AM</td>
                            <td>Admin</td>
                            <td>Login</td>
                            <td>Admin logged into the system.</td>
                        </tr>
                        <tr>
                            <td>01/01/2023 10:05 AM</td>
                            <td>Admin</td>
                            <td>Update</td>
                            <td>Updated site settings.</td>
                        </tr>
                        <!-- Repeat for more logs -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Toggle Sidebar
        document.getElementById("sidebarCollapse").addEventListener("click", function () {
            document.getElementById("sidebar").classList.toggle("active");
        });
    </script>
</body>
</html>
