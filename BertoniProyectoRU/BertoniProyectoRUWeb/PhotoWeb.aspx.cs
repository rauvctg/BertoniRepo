using Entities.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BertoniProyectoRUWeb
{
    public partial class PhotoWeb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                PopulatedPhotos();
            }
        }

        private void PopulatedPhotos()
        {
            var albumID = Request.QueryString["ai"];

            WebRequest request = WebRequest.Create("https://jsonplaceholder.typicode.com/photos");
            request.Method = "GET";
            WebResponse response = request.GetResponse();

            Stream responseStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(responseStream);
            string responseFromReaderStr = reader.ReadToEnd();

            reader.Close();
            responseStream.Close();

            List<Photo> photos = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Photo>>(responseFromReaderStr);

            if (photos.Any())
            {
                var photoFound = photos.Where(x => x.albumId == int.Parse(albumID)).ToList();
                grdPhotos.DataSource = photoFound;
                grdPhotos.DataBind();
            }

        }

        protected void btnVerComentarios_Click(object sender, EventArgs e)
        {
            var buttonControl = (Button)sender;
            var photoID = buttonControl.CommandArgument;

            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "VerComentarios", "VerComentarios(" + photoID + ")", true);

        }

        [WebMethod(true)]
        public void DisplayCommentAbove(Comment comment)
        {

        }
    }
}