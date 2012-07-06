<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="TransferXML.aspx.cs" Inherits="ASP_NBA_Project.TransferXML" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <table>
        <tr>
            <td>Изберете номер на XML файла който желаете да прехвърлите в DB:</td>
            <td style="width: 30%"><asp:TextBox ID="TextBoxFileNumber" runat="server" style="width:20%"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="ButtonSubmitTeam" runat="server" 
                    Text="Прехвърли и Валидирай" Width="200px" onclick="ButtonSubmitTeam_Click" />
            </td>
        </tr>
    </table>
    
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
