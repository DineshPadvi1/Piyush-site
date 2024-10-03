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
                LoadLogosFromDatabase();
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
                "https://img.freepik.com/free-vector/golden-bird-logo-design_1195-336.jpg?t=st=1727974577~exp=1727975177~hmac=035c14eadfbc690e5eba878043454bc8de497ac9f3fce4e8d8b5bfe959a5e32d",
                "https://png.pngtree.com/png-vector/20220226/ourmid/pngtree-100-natural-product-label-design-vector-and-png-png-image_4463862.png",
                "https://i.pinimg.com/736x/30/79/eb/3079eb9d9dcea507c1e9d0d929bc8370.jpg"
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

        private void LoadLogosFromDatabase()
        {
            // Connection string from web.config
            //string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            //using (SqlConnection conn = new SqlConnection(connectionString))
            //{
            //    try
            //    {
            //        conn.Open();
            //         SQL Query to get the logos
            //        string query = "SELECT Logo1Url, Logo2Url FROM LogosTable WHERE Id = 1"; // Change according to your table

            //        SqlCommand cmd = new SqlCommand(query, conn);

            //        SqlDataReader reader = cmd.ExecuteReader();

            //        if (reader.Read())
            //        {
            //             Assuming you have two columns: Logo1Url and Logo2Url
            //            string logo1Url = reader["Logo1Url"].ToString();
            //            string logo2Url = reader["Logo2Url"].ToString();

            //             Set the image URLs dynamically
            //            logo1.Src = logo1Url;
            //            logo2.Src = logo2Url;
            //        }

            //        reader.Close();
            //    }
            //    catch (Exception ex)
            //    {
            //         Handle your exception here (logging, user-friendly message, etc.)
            //        Console.WriteLine("Error: " + ex.Message);
            //    }
            //}
        }
    }
}
