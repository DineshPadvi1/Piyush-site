using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WelcomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //LoadNews();
                LoadCarouselImages();
            }
        }

        // Load news alerts from the database
        private void LoadNews()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT NewsText FROM NewsAlerts";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                string news = "";
                while (reader.Read())
                {
                    news += reader["NewsText"].ToString() + " | ";
                }

                // Remove the last separator and set news content
                if (news.Length > 0)
                    news = news.Substring(0, news.Length - 3);

                newsContent.InnerText = news;
            }
        }

        // Load carousel images from the database
        private void LoadCarouselImages()
        {
            //string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            //using (SqlConnection conn = new SqlConnection(connectionString))
            //{
            //string query = "SELECT ImageUrl FROM CarouselImages";
            //SqlCommand cmd = new SqlCommand(query, conn);
            //conn.Open();
            //SqlDataReader reader = cmd.ExecuteReader();

            //int counter = 0;
            //while (reader.Read())
            //{
            //    string imageUrl = reader["ImageUrl"].ToString();
            //    // Create the carousel item dynamically
            //    System.Web.UI.HtmlControls.HtmlGenericControl div = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            //    div.Attributes.Add("class", counter == 0 ? "carousel-item active" : "carousel-item");

            //    // Add image tag
            //    System.Web.UI.HtmlControls.HtmlImage img = new System.Web.UI.HtmlControls.HtmlImage();
            //    img.Src = imageUrl;
            //    img.Attributes.Add("class", "d-block w-100");
            //    div.Controls.Add(img);

            //    // Add the div to the carousel inner container
            //    imageCarousel.Controls.Add(div);
            //    counter++;
            //}

            // Sample online image URLs
            string[] imageUrls = new string[]
            {
                "https://via.placeholder.com/800x400.png?text=Image+1",
                "https://via.placeholder.com/800x400.png?text=Image+2",
                "https://via.placeholder.com/800x400.png?text=Image+3"
            };

            // Add images to the carousel dynamically
            int counter = 0;
            foreach (var imageUrl in imageUrls)
            {
                // Create the carousel item dynamically
                System.Web.UI.HtmlControls.HtmlGenericControl div = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                div.Attributes.Add("class", counter == 0 ? "carousel-item active" : "carousel-item");

                // Add image tag
                System.Web.UI.HtmlControls.HtmlImage img = new System.Web.UI.HtmlControls.HtmlImage();
                img.Src = imageUrl;
                img.Attributes.Add("class", "d-block w-100");
                div.Controls.Add(img);

                // Add the div to the carousel inner container
                imageCarousel.Controls.Add(div);
                counter++;
            }
            //}
        }
    }
}
