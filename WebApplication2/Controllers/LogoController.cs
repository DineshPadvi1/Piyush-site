using System;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Hosting;
using System.Web.Http;
using WebApplication2.Login;

public class LogoController : ApiController
{
    //[HttpPost]
    //[Route("api/logo/upload")]
    //public async Task<IHttpActionResult> UploadLogo()
    //{
    //    if (!Request.Content.IsMimeMultipartContent())
    //    {
    //        return BadRequest("Unsupported media type.");
    //    }

    //    var provider = new MultipartMemoryStreamProvider();
    //    await Request.Content.ReadAsMultipartAsync(provider);

    //    foreach (var file in provider.Contents)
    //    {
    //        var filename = file.Headers.ContentDisposition.FileName.Trim('"');
    //        var buffer = await file.ReadAsByteArrayAsync();

    //        // Save the logo to a directory, or hold it in memory for further processing
    //        var filePath = Path.Combine("YourLogoDirectory", filename);
    //        File.WriteAllBytes(filePath, buffer);
    //    }

    //    return Ok("Logo uploaded successfully.");
    //}

    [HttpPost]
    [Route("api/login")]
    public async Task<IHttpActionResult> get([FromBody] logincred user)
    {
        return Ok("Active!");
    }

    [HttpPost]
    [Route("api/logo/upload")]
    public async Task<IHttpActionResult> UploadLogo()
    {
        if (!Request.Content.IsMimeMultipartContent())
        {
            return BadRequest("Unsupported media type.");
        }

        var provider = new MultipartMemoryStreamProvider();
        await Request.Content.ReadAsMultipartAsync(provider);

        // Use HostingEnvironment to map the path
        var directoryPath = HostingEnvironment.MapPath("~/Images/Logo");
        var fileName = "logo1.jpg";
        var filePath = Path.Combine(directoryPath, fileName);
        var backupFilePath = Path.Combine(directoryPath, "logo1_backup.jpg");

        // Ensure the directory exists
        if (!Directory.Exists(directoryPath))
        {
            Directory.CreateDirectory(directoryPath);
        }

        // Backup the existing file if it exists
        if (File.Exists(filePath))
        {
            File.Copy(filePath, backupFilePath, true); // Overwrite any existing backup
        }

        foreach (var file in provider.Contents)
        {
            var buffer = await file.ReadAsByteArrayAsync();

            try
            {
                // Save the new logo
                File.WriteAllBytes(filePath, buffer);
            }
            catch (Exception ex)
            {
                // Log the error if needed
                Console.WriteLine($"Error writing file: {ex.Message}");

                // Restore the old file from backup
                if (File.Exists(backupFilePath))
                {
                    File.Copy(backupFilePath, filePath, true); // Restore the backup
                }
                return InternalServerError(new Exception("Failed to upload logo. Old logo restored."));
            }
        }

        // If no errors occurred, delete the backup
        if (File.Exists(backupFilePath))
        {
            File.Delete(backupFilePath);
        }

        return Ok("Logo uploaded and replaced successfully.");
    }



    [Route("api/slideshow/upload")]
    public async Task<IHttpActionResult> UploadSlide()
    {
        if (!Request.Content.IsMimeMultipartContent())
        {
            return BadRequest("Unsupported media type.");
        }

        var provider = new MultipartMemoryStreamProvider();
        await Request.Content.ReadAsMultipartAsync(provider);

        foreach (var file in provider.Contents)
        {
            var filename = file.Headers.ContentDisposition.FileName.Trim('"');
            var buffer = await file.ReadAsByteArrayAsync();

            // Save the logo to a directory, or hold it in memory for further processing
            var filePath = Path.Combine("YourLogoDirectory", filename);
            File.WriteAllBytes(filePath, buffer);
        }

        return Ok("Logo uploaded successfully.");
    }
}
