<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="ValidateXml.aspx.cs" Inherits="ASP_NBA_Project.ValidateXml" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
         <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="up1">
            <ContentTemplate>
                <asp:Panel ID="PanelResults" runat="server">
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
