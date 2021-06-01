<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoWeb.aspx.cs" MasterPageFile="~/Site.Master" Inherits="BertoniProyectoRUWeb.PhotoWeb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function VerComentarios(commentID) {
            $.ajax({
                url: "https://jsonplaceholder.typicode.com/comments/" + commentID,
                method: "GET"
            }).then(function (data) {
                if (data !== 'undefined' && data !== '' && data !== null) {
                    $("#postIdlabel").text(data.postId);
                    $("#bodyText").text(data.body);
                    $("#emailText").text(data.email);
                    $("#idText").text(data.id);
                    $("#nameText").text(data.name);

                    $('html,body').animate({
                        scrollTop: $(".downra").offset().top
                    },'slow');
                }
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
                    <input type="button" value="Ver Comentarios" class="btn btn-primary" ID="btnVerComentarios" onclick='VerComentarios(<%# Eval("id") %>)' />
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>

    <h2>Comentarios</h2>
    <div class="form-group downra row" id="divComentarios">
        <label class="col-sm-2 col-form-label">PostID</label>
        <div class="col-sm-4">
          <label style="font-weight:normal !important;" id="postIdlabel"></label>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Body</label>
        <div class="col-sm-4">
          <label style="font-weight:normal !important;" id="bodyText"></label>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-4">
          <label style="font-weight:normal !important;" id="emailText"></label>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Id</label>
        <div class="col-sm-4">
          <label style="font-weight:normal !important;" id="idText"></label>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Name</label>
        <div class="col-sm-4">
          <label style="font-weight:normal !important;" id="nameText"></label>
        </div>
    </div>
</asp:Content>
