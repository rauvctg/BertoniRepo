<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoWeb.aspx.cs" MasterPageFile="~/Site.Master" Inherits="BertoniProyectoRUWeb.PhotoWeb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function VerComentarios(commentID) {
            $.ajax({
                url: "https://jsonplaceholder.typicode.com/comments/" + commentID,
                method: "GET"
            }).then(function (data) {
                var commentJsonObject = JSON.stringify(data);
                console.log(commentJsonObject);
                DisplayCommentInGrid(commentJsonObject);
            });

        }

        function DisplayCommentInGrid(comments) {
            console.log(comments);
            $.ajax({
                url: "/PhotoWeb.aspx/DisplayCommentAbove?comments=" + comments ,
                method: "POST",
                data: comments,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
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
