using Entities.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BertoniProyectoRUWeb
{
    public partial class AlbumWeb : System.Web.UI.Page
    {
        private string currentAlbumIDSelected;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetAlbums();
            }
            
        }

        private void GetAlbums()
        {
            WebRequest request = WebRequest.Create("https://jsonplaceholder.typicode.com/albums");
            request.Method = "GET";
            WebResponse response = request.GetResponse();

            Stream responseStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(responseStream);
            string responseFromReaderStr = reader.ReadToEnd();

            reader.Close();
            responseStream.Close();

            List<Album> albums = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Album>>(responseFromReaderStr);

            if(albums.Any())
            {
                ddlAlbums.DataSource = albums;
                ddlAlbums.DataValueField = "id";
                ddlAlbums.DataTextField = "title";
                ddlAlbums.DataBind();

                ddlAlbums.SelectedIndex = 0;
            }
        }

        protected void btnSeeAlbumDetail_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PhotoWeb.aspx?ai=" + ddlAlbums.SelectedValue);
        }
    }
}