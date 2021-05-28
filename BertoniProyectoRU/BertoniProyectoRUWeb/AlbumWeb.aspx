<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlbumWeb.aspx.cs" MasterPageFile="~/Site.Master" Inherits="BertoniProyectoRUWeb.AlbumWeb" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Albums</h2>
    <div class="form-group">
        <asp:DropDownList CssClass="dropdown" runat="server" ID="ddlAlbums"></asp:DropDownList>
    </div>
    <div class="form-group">
        <asp:Button runat="server" ID="btnSeeAlbumDetail" Text="Visualizar Álbum" CssClass="btn btn-primary" OnClick="btnSeeAlbumDetail_Click"></asp:Button>
    </div>
    
</asp:Content>
