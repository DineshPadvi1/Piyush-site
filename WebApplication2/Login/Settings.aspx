<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="WebApplication2.Login.Settings" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Settings</title>
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

        /* Settings Form */
        .settings-form {
            max-width: 600px;
            margin: 0 auto;
        }

        .settings-form label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        .settings-form input[type="text"],
        .settings-form input[type="password"],
        .settings-form select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .settings-form button {
            margin-top: 20px;
            padding: 10px 20px;
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
                <h3>Settings</h3>
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
            
            <!-- Main Settings Content -->
            <div class="dashboard">
                <h2>General Settings</h2>
                <div class="settings-form">
                    <label for="siteName">Site Name</label>
                    <input type="text" id="siteName" name="siteName" value="My Website">

                    <label for="adminEmail">Admin Email</label>
                    <input type="text" id="adminEmail" name="adminEmail" value="admin@example.com">

                    <label for="timezone">Timezone</label>
                    <select id="timezone" name="timezone">
                        <option value="UTC">UTC</option>
                        <option value="EST">EST</option>
                        <option value="PST">PST</option>
                        <!-- Add more timezones -->
                    </select>

                    <button class="btn btn-primary">Save Settings</button>
                </div>
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
