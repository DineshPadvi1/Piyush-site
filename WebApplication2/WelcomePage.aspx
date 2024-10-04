<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomePage.aspx.cs" Inherits="WebApplication2.WelcomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Atharv Digital Seva Kendra</title>
    <!-- Add Bootstrap for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        /* Styling for the news ticker */
        .news-ticker {
            background-color: #f8f9fa;
            padding: 5px;
            overflow: hidden;
            white-space: nowrap;
            border: 1px solid #dee2e6;
            border-radius: 5px;
        }

        .news-text {
            display: inline-block;
            font-size: 16px;
            color: #ff0000;
            animation: slideLeft 12s linear infinite;
        }

        @keyframes slideLeft {
            from {
                transform: translateX(100%);
            }
            to {
                transform: translateX(-100%);
            }
        }

        /* Styling for the image carousel */
        .carousel-item img {
            height: 300px; /* Reduced height */
            width: 100%; /* Full width */
            object-fit: cover; /* Ensure the image covers the area */
        }

        /* Button styles */
        .btn-custom {
            font-size: 14px;
            padding: 8px 16px;
            margin: 5px;
            border-radius: 25px;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-custom:hover {
            background-color: #007bff; /* Change to your preferred hover color */
            color: white; /* Text color on hover */
        }

        /* Logo styling */
        .logo {
            max-width: 80px; /* Adjusted size for logos */
            height: auto; /* Maintain aspect ratio */
        }

        /* Centered heading text */
        h1 {
            font-size: 24px; /* Reduced heading size */
        }

        /* Reduce margin for action buttons */
        .action-buttons {
            margin-top: 30px;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="row align-items-center mb-4">
                <!-- Left Logo -->
                <div class="col-md-3 text-center">
                    <img src="<%= ResolveUrl("~/images/Logo/logo1.jpg") %>" alt="Logo 1" class="logo" id="logo1" />
                </div>

                <!-- Page Heading -->
                <div class="col-md-6 text-center">
                    <h1 class="text-primary"><strong>Atharv Digital Seva Kendra</strong></h1>
                </div>

                <!-- Right Logo -->
                <div class="col-md-3 text-center">
                    <img src="<%= ResolveUrl("~/images/Logo/logo2.jpg") %>" alt="Logo 2" class="logo" id="logo2" />
                </div>
            </div>

            <!-- News Ticker -->
            <div class="news-ticker mb-4">
                <span class="news-text" id="newsContent" runat="server">Loading news...</span>
            </div>

            <!-- Image Slider / Carousel -->
            <div id="carouselExampleControls" class="carousel slide mt-4" data-bs-ride="carousel">
                <div class="carousel-inner" runat="server" id="imageCarousel">
                    <!-- Repeater for dynamic images will be filled here -->
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons mt-4">
                <a href="MahaOnline.aspx" class="btn btn-primary btn-custom">महा-ऑनलाइन</a>
                <a href="ShaskiyYojana.aspx" class="btn btn-primary btn-custom">शासकीय योजना</a>
                <a href="ShaskiyKarya.aspx" class="btn btn-primary btn-custom">शासकीय कार्य</a>
                <a href="ShaskiyaBharti.aspx" class="btn btn-primary btn-custom">शासकीय भरती</a>
            </div>
        </div>
    </form>

    <!-- Add Bootstrap and jQuery for carousel functionality -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Additional JavaScript to load dynamic content
        $(document).ready(function () {
            // Example of setting news dynamically (you can set this from the server-side)
            let newsAlerts = [
                "Welcome to Atharv Digital Seva Kendra!",
                "Get your documents processed online.",
                "New services have been launched.",
                "Announcements: Stay tuned for updates."
            ];
            let ticker = $('#newsContent');
            let tickerText = newsAlerts.join(" | ");
            ticker.text(tickerText);
        });
    </script>
</body>
</html>
