<%@ Page Title="New Team" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="NewTeam.aspx.cs" Inherits="ASP_NBA_Project.NewTeam" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Нов Отбор
    </h2>

    <table style="width: 600px;">
        <tr>
            <td>Отбор*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamName" runat="server" style="width:100%"></asp:TextBox></td>
        </tr>
        <tr>
            <td>победи*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamWins" runat="server"></asp:TextBox></td>
        </tr>
          <tr>
            <td>загуби*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamLoses" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>дивизия:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamInDivision" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>плейофи:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamPlayoffs" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>История*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamHistory" runat="server" Height="155px" 
            TextMode="MultiLine" Width="350px"></asp:TextBox></td>
        </tr>
         <tr>
            <td>титли в дивизията:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamDivisionTitles" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>титли в конференцията:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamConferenceTitles" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>титли в НБА:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxTeamLeagueTitles" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Известни хора свързани с отбора:&nbsp;</td>
            <td style="width: 100%">
                <asp:TextBox ID="TextBoxTeamNotablePeople" runat="server" Height="64px" 
            TextMode="MultiLine" Width="351px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Зала*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxArenaName" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>брой места*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxArenaSeats" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td style="width: 100%"><br/><b>Състав:</b></td>
        </tr>
        <tr>
            <td>Плеймейкър*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxRosterPlaymaker" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Гард*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxRosterGuard" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Леко-Крило*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxRosterSmallForward" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Тежко-Крило*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxRosterPowerForward" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Център*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxRosterCenter" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td style="width: 100%"><br/><b>Свободен агент(и):</b></td>
        </tr>
        <tr>
            <td>Име:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxFreeAgent1Name" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Оферта на стойност:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxFreeAgent1QualOffer" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Препокрита:&nbsp;</td>
            <td style="width: 100%">
            <asp:RadioButton id="RadioButtonFreeAgent1QualOfferMatchedY" Text="Да" GroupName="matchedOrNot" runat="server"/>
            <br/>
            <asp:RadioButton id="RadioButtonFreeAgent1QualOfferMatchedN" Text="Не" GroupName="matchedOrNot" Checked="True" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>Години с отбора:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxFreeAgent1YearsWTeam" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td style="width: 100%"><br/><b>Звезда(и):</b></td>
        </tr>
        <tr>
            <td>Име*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxStar1Name" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Години про*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxStar1YearsPro" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Заплата*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxStar1Salary" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Средно точки на мач*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxStar1AvgPts" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td style="width: 100%"><br/><b>Треньор:</b></td>
        </tr>
        <tr>
            <td>Име*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxCoachName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Заплата:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxCoachSalary" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Има титла?:&nbsp;</td>
            <td style="width: 100%">
            <asp:RadioButton id="RadioButtonCoachHasTitleY" Text="Да" GroupName="hasTitleOrNot" runat="server"/>
            <br/>
            <asp:RadioButton id="RadioButtonCoachHasTitleN" Text="Не" GroupName="hasTitleOrNot" Checked="True" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>Години:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxCoachYearsOld" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td style="width: 100%"><br/><b>Допълнителна информация</b></td>
        </tr>
        <tr>
            <td>Собственик*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxAddInfoOwnerName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Милиардер? :&nbsp;</td>
            <td style="width: 100%">
            <asp:RadioButton id="RadioButtonbillionaireY" Text="Да" GroupName="billionaireOrNot" runat="server"/>
            <br/>
            <asp:RadioButton id="RadioButtonbillionaireN" Text="Не" GroupName="billionaireOrNot" Checked="True" runat="server"/>
            </td>
        </tr>
         <tr>
            <td>Мениджър*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxAddInfoManagerName" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Официален сайт*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxAddInfoSite" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Цветове на отбора*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxAddInfoColors" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Цена на отбора*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxAddInfoValue" runat="server"></asp:TextBox></td>
        </tr>
         <tr>
            <td>Позиция в драфта*:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxAddInfoDraftPosition" runat="server"></asp:TextBox></td>
        </tr> 
         <tr>
            <td>Отбор от D-лигата:&nbsp;</td>
            <td style="width: 100%"><asp:TextBox ID="TextBoxAddInfoDleagueАffiliate" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td colspan="2">
                <asp:Button ID="ButtonSubmitTeam" runat="server" 
                    Text="Добави" Width="89px" onclick="ButtonSubmitTeam_Click" />
             </td>
  
        </tr>                                 
    </table>
    <p>Полетата отбелязани с * са задължителни!</p>
</asp:Content>
