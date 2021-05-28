<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoWeb.aspx.cs" MasterPageFile="~/Site.Master" Inherits="BertoniProyectoRUWeb.PhotoWeb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function VerComentarios(commentID) {
            $.ajax({
                url: "https://jsonplaceholder.typicode.com/comments/" + commentID,
                method: "GET"
            }).then(function (data) {
                var commentJsonObject = JSON.parse(data);
                console.log(data);
                console.log(comment);
                console.log(commentJsonObject);
                var bodyStr = comment.body
            });

        }
    </script>
    <h2>Photos</h2>
    <asp:DataGrid runat="server" ID="grdPhotos" AutoGenerateColumns="false" CellSpacing="3">
        <Columns>
            <asp:BoundColumn HeaderText="AlbumID" DataField="albumID">
            </asp:BoundColumn>
            <asp:BoundColumn HeaderText="ID" DataField="id">
            </asp:BoundColumn>
            <asp:BoundColumn HeaderText="Title" DataField="title">
            </asp:BoundColumn>
            <asp:BoundColumn HeaderText="URL" DataField="url">
            </asp:BoundColumn>
            <asp:BoundColumn HeaderText="ThumbnailURL" DataField="thumnailUrl">
            </asp:BoundColumn>
            <asp:BoundColumn HeaderText="id" DataField="id">
            </asp:BoundColumn>
            <asp:TemplateColumn>
                <ItemTemplate>
                    <asp:Button Text="Ver Comentarios" CssClass="btn btn-primary" runat="server" ID="btnVerComentarios" CommandArgument='<%# Eval("id") %>' OnClick="btnVerComentarios_Click" />
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
    
</asp:Content>
