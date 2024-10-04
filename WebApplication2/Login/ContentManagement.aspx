<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentManagement.aspx.cs" Inherits="WebApplication2.Login.ContentManagement" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Content Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            border-radius: 10px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-bottom: 30px;
        }
        .alert {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Current News Alert</h2>
            <div id="currentNewsAlert">
                <!-- Current News Alert will be displayed here -->
                <p id="newsText"></p>
                <div id="newsImages" class="d-flex flex-wrap">
                    <!-- News alert images will be displayed here -->
                </div>
            </div>

            <h2>Update News Alerts</h2>
            <div class="mb-3">
                <label for="alertText" class="form-label">News Alert Text</label>
               <%-- <asp:TextBox ID="alertText" runat="server" CssClass="form-control" placeholder="Enter news alert text" required></asp:TextBox>--%>
            </div>
            <asp:Button ID="btnUpdateAlert" runat="server" CssClass="btn btn-primary" Text="Update Alert Text" OnClick="UpdateAlertText" />

            <h2>Upload News Alert Image</h2>
            <div class="mb-3">
                <label for="imageUpload" class="form-label">Upload Image</label>
                <asp:FileUpload ID="imageUpload" runat="server" CssClass="form-control" accept="image/*" />
            </div>
           <%-- <asp:Button ID="btnUploadImage" runat="server" CssClass="btn btn-primary" Text="Upload Image" OnClick="UploadImage" />--%>
            
            <div id="alertMessage" class="alert alert-success" runat="server"></div>
        </div>
    </form>

    <script>
        // Function to display current news alert and images
        function loadCurrentNewsAlert() {
            // Simulate fetching data. Replace this with your AJAX call or fetch from the server.
            const newsAlert = {
                text: "Welcome to our website! Stay tuned for updates.",
                images: [
                    "image1.jpg",
                    "image2.jpg"
                ]
            };

            $('#newsText').text(newsAlert.text);
            const newsImagesDiv = $('#newsImages');
            newsImagesDiv.empty(); // Clear previous images
            newsAlert.images.forEach(image => {
                newsImagesDiv.append(`<img src="${image}" alt="News Image" class="img-thumbnail m-2" style="width: 100px; height: 100px;">`);
            });
        }

        // Call the function to load current news alert when the page loads
        $(document).ready(function () {
            loadCurrentNewsAlert();
        });
    </script>
</body>
</html>
