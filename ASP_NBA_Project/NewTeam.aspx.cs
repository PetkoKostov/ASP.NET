using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;

namespace ASP_NBA_Project
{
    public partial class NewTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetQualOffer()
        {
            if (this.RadioButtonFreeAgent1QualOfferMatchedN.Text == "Не")
                return RadioButtonFreeAgent1QualOfferMatchedN.Text; // <- like this
            else
                return RadioButtonFreeAgent1QualOfferMatchedY.Text;
        }

        protected string CoachHasTitle()
        {
            if (this.RadioButtonCoachHasTitleY.Text == "Да")
                return "Да"; // <- or like this
            else
                return "Не";
        }

        protected void ButtonSubmitTeam_Click(object sender, EventArgs e)
        {
            nbaDBEntities nbaDB = new nbaDBEntities();
            Team newTeam = new Team();
            newTeam.name = this.TextBoxTeamName.Text;
            newTeam.wins = int.Parse(this.TextBoxTeamWins.Text);
            newTeam.loses = int.Parse(this.TextBoxTeamLoses.Text);
            newTeam.in_division = this.TextBoxTeamInDivision.Text;
            newTeam.playoffs = this.TextBoxTeamPlayoffs.Text;
            newTeam.history = this.TextBoxTeamHistory.Text;

            nbaDB.Teams.AddObject(newTeam);
            nbaDB.SaveChanges();

            Achievment newAchievment = new Achievment();
            newAchievment.teamID = newTeam.teamID;
            newAchievment.division_titles = int.Parse(this.TextBoxTeamDivisionTitles.Text);
            newAchievment.conference_titles = int.Parse(this.TextBoxTeamConferenceTitles.Text);
            newAchievment.league_titles = int.Parse(this.TextBoxTeamLeagueTitles.Text);
            newAchievment.notable_people = this.TextBoxTeamNotablePeople.Text;

            nbaDB.Achievments.AddObject(newAchievment);

            Arena newArena = new Arena();
            newArena.teamID = newTeam.teamID;
            newArena.name = this.TextBoxArenaName.Text;
            newArena.seats = int.Parse(this.TextBoxArenaSeats.Text);

            nbaDB.Arenas.AddObject(newArena);

            Player newPlayer1 = new Player();
            newPlayer1.teamID = newTeam.teamID;
            newPlayer1.name = this.TextBoxRosterPlaymaker.Text;
            newPlayer1.position = "Плеймейкър";

            nbaDB.Players.AddObject(newPlayer1);

            Player newPlayer2 = new Player();
            newPlayer2.teamID = newTeam.teamID;
            newPlayer2.name = this.TextBoxRosterGuard.Text;
            newPlayer2.position = "Гард";

            nbaDB.Players.AddObject(newPlayer2);

            Player newPlayer3 = new Player();
            newPlayer3.teamID = newTeam.teamID;
            newPlayer3.name = this.TextBoxRosterSmallForward.Text;
            newPlayer3.position = "Леко-Крило";

            nbaDB.Players.AddObject(newPlayer3);

            Player newPlayer4 = new Player();
            newPlayer4.teamID = newTeam.teamID;
            newPlayer4.name = this.TextBoxRosterPowerForward.Text;
            newPlayer4.position = "Тежко-Крило";

            nbaDB.Players.AddObject(newPlayer4);

            Player newPlayer5 = new Player();
            newPlayer5.teamID = newTeam.teamID;
            newPlayer5.name = this.TextBoxRosterCenter.Text;
            newPlayer5.position = "Център";

            nbaDB.Players.AddObject(newPlayer5);

            Free_Agents newFA = new Free_Agents();
            newFA.teamID = newTeam.teamID;
            newFA.name = this.TextBoxFreeAgent1Name.Text;
            newFA.qual_offer = int.Parse(this.TextBoxFreeAgent1QualOffer.Text);
            if(this.RadioButtonFreeAgent1QualOfferMatchedN.Text == "Не")
                newFA.match = RadioButtonFreeAgent1QualOfferMatchedN.Text;
            else
                newFA.match = RadioButtonFreeAgent1QualOfferMatchedY.Text;
            newFA.years_w_team = int.Parse(this.TextBoxFreeAgent1YearsWTeam.Text);

            nbaDB.Free_Agents.AddObject(newFA);

            Star newStar = new Star();
            newStar.teamID = newTeam.teamID;
            newStar.name = this.TextBoxStar1Name.Text;
            newStar.years_pro = int.Parse(this.TextBoxStar1YearsPro.Text);
            newStar.salary = double.Parse(this.TextBoxStar1Salary.Text);
            newStar.avg_pts = double.Parse(this.TextBoxStar1AvgPts.Text);

            nbaDB.Stars.AddObject(newStar);

            Coach newCoach = new Coach();
            newCoach.teamID = newTeam.teamID;
            newCoach.name = this.TextBoxCoachName.Text;
            newCoach.salary = double.Parse(this.TextBoxCoachSalary.Text);
            if (this.RadioButtonCoachHasTitleY.Text == "Да")
                newCoach.has_title = "Да";
            else
                newCoach.has_title = "Не";
            newCoach.years_old = int.Parse(this.TextBoxCoachYearsOld.Text);

            nbaDB.Coaches.AddObject(newCoach);

            Add_Info newAddInfo = new Add_Info();
            newAddInfo.teamID = newTeam.teamID;
            newAddInfo.owner = this.TextBoxAddInfoOwnerName.Text;
            newAddInfo.manager = this.TextBoxAddInfoManagerName.Text;
            newAddInfo.site = this.TextBoxAddInfoSite.Text;
            newAddInfo.colors = this.TextBoxAddInfoColors.Text;
            newAddInfo.value = double.Parse(this.TextBoxAddInfoValue.Text);
            newAddInfo.draft_position = int.Parse(this.TextBoxAddInfoDraftPosition.Text);
            newAddInfo.dleague_affiliate = this.TextBoxAddInfoDleagueАffiliate.Text;

            nbaDB.Add_Info.AddObject(newAddInfo);

            nbaDB.SaveChanges();

            //XML

            // Create the xml document containe
            XmlDocument doc = new XmlDocument();// Create the XML Declaration, and append it to XML document
            XmlDeclaration dec = doc.CreateXmlDeclaration("1.0", null, null);
            doc.AppendChild(dec);// Create the root element
            XmlElement root = doc.CreateElement("chap");
            doc.AppendChild(root);
            // Insert the DTD
            XmlDocumentType docType = doc.CreateDocumentType("chap", null, Server.MapPath("~/App_Data/myDTD.dtd"), null);
            doc.InsertBefore(docType, root);

            XmlElement team = doc.CreateElement("team");
            team.InnerText = this.TextBoxTeamName.Text;
            team.SetAttribute("wins", this.TextBoxTeamWins.Text);
            team.SetAttribute("loses", this.TextBoxTeamLoses.Text);
            team.SetAttribute("playoffs", this.TextBoxTeamPlayoffs.Text);
            team.SetAttribute("in_division", this.TextBoxTeamInDivision.Text);
            root.AppendChild(team);// append to the root

            XmlElement history = doc.CreateElement("history");
            history.InnerText = this.TextBoxTeamHistory.Text;
            root.AppendChild(history);// append to the root

            XmlElement achievments = doc.CreateElement("achievments");
                    XmlElement division_titles = doc.CreateElement("division_titles");
                    division_titles.InnerText = this.TextBoxTeamDivisionTitles.Text;
                    XmlElement conference_titles = doc.CreateElement("conference_titles");
                    conference_titles.InnerText = this.TextBoxTeamConferenceTitles.Text;
                    XmlElement league_titles = doc.CreateElement("league_titles");
                    league_titles.InnerText = this.TextBoxTeamLeagueTitles.Text;
                    XmlElement notable_people = doc.CreateElement("notable_people");
                    notable_people.InnerText = this.TextBoxTeamNotablePeople.Text;
               achievments.AppendChild(division_titles);
               achievments.AppendChild(conference_titles);
               achievments.AppendChild(league_titles);
               achievments.AppendChild(notable_people);
           root.AppendChild(achievments);// append to the root

           XmlElement arena = doc.CreateElement("arena");
           arena.InnerText = this.TextBoxArenaName.Text;
           arena.SetAttribute("seats", this.TextBoxArenaSeats.Text);
           root.AppendChild(arena);// append to the root

           XmlElement roster = doc.CreateElement("roster");
            XmlElement player1 = doc.CreateElement("player");
            player1.InnerText = this.TextBoxRosterPlaymaker.Text;
            player1.SetAttribute("position", "Плеймейкър");

            XmlElement player2 = doc.CreateElement("player");
            player2.InnerText = this.TextBoxRosterGuard.Text;
            player2.SetAttribute("position", "Гард");

            XmlElement player3 = doc.CreateElement("player");
            player3.InnerText = this.TextBoxRosterSmallForward.Text;
            player3.SetAttribute("position", "Леко-Крило");

            XmlElement player4 = doc.CreateElement("player");
            player4.InnerText = this.TextBoxRosterPowerForward.Text;
            player4.SetAttribute("position", "Тежко-Крило");

            XmlElement player5 = doc.CreateElement("player");
            player5.InnerText = this.TextBoxRosterCenter.Text;
            player5.SetAttribute("position", "Център");

            roster.AppendChild(player1);
            roster.AppendChild(player2);
            roster.AppendChild(player3);
            roster.AppendChild(player4);
            roster.AppendChild(player5);

         root.AppendChild(roster);// append to the root

         XmlElement freeAgent = doc.CreateElement("free_agent");
            XmlElement fa_name = doc.CreateElement("fa_name");
            fa_name.InnerText = this.TextBoxFreeAgent1Name.Text;
            XmlElement fa_qual_ofer = doc.CreateElement("qual_offer");
            fa_qual_ofer.InnerText = this.TextBoxFreeAgent1QualOffer.Text;
            fa_qual_ofer.SetAttribute("matched", GetQualOffer());
            XmlElement fa_years_w_team = doc.CreateElement("years_w_team");
            fa_years_w_team.InnerText = this.TextBoxFreeAgent1YearsWTeam.Text;
            freeAgent.AppendChild(fa_name);
            freeAgent.AppendChild(fa_qual_ofer);
            freeAgent.AppendChild(fa_years_w_team);
        root.AppendChild(freeAgent);// append to the root

        XmlElement star = doc.CreateElement("star");
            XmlElement starName = doc.CreateElement("star_name");
            starName.InnerText = this.TextBoxStar1Name.Text;
            XmlElement yearsPro = doc.CreateElement("years_pro");
            yearsPro.InnerText = this.TextBoxStar1YearsPro.Text;
            XmlElement salary = doc.CreateElement("salary");
            salary.InnerText = this.TextBoxStar1Salary.Text;
            XmlElement avgPts = doc.CreateElement("avg_pts");
            avgPts.InnerText = this.TextBoxStar1AvgPts.Text;
            star.AppendChild(starName);
            star.AppendChild(yearsPro);
            star.AppendChild(salary);
            star.AppendChild(avgPts);
        root.AppendChild(star);// append to the root

        XmlElement coach = doc.CreateElement("coach");
        coach.InnerText = this.TextBoxCoachName.Text;
        coach.SetAttribute("salary", this.TextBoxCoachSalary.Text);
        coach.SetAttribute("has_title", CoachHasTitle());
        coach.SetAttribute("years_old", this.TextBoxCoachYearsOld.Text);
        root.AppendChild(coach);// append to the root

        XmlElement addInfo = doc.CreateElement("add_info");
            XmlElement owner = doc.CreateElement("owner");
            owner.InnerText = this.TextBoxAddInfoOwnerName.Text;
            owner.SetAttribute("billionaire", "Не");
            XmlElement manager = doc.CreateElement("manager");
            manager.InnerText = this.TextBoxAddInfoManagerName.Text;
            XmlElement site = doc.CreateElement("site");
            site.InnerText = this.TextBoxAddInfoSite.Text;
            XmlElement colors = doc.CreateElement("colors");
            colors.InnerText = this.TextBoxAddInfoColors.Text;           
            XmlElement value = doc.CreateElement("value");
            value.InnerText = this.TextBoxAddInfoValue.Text;
            XmlElement draftPos = doc.CreateElement("draft_position");
            draftPos.InnerText = this.TextBoxAddInfoDraftPosition.Text;
            XmlElement dlAffiliate = doc.CreateElement("dleague_affiliate");
            dlAffiliate.InnerText = this.TextBoxAddInfoDleagueАffiliate.Text;
            addInfo.AppendChild(owner);
            addInfo.AppendChild(manager);
            addInfo.AppendChild(site);
            addInfo.AppendChild(colors);
            addInfo.AppendChild(value);
            addInfo.AppendChild(draftPos);
            addInfo.AppendChild(dlAffiliate);
       root.AppendChild(addInfo);

       string path1 = Server.MapPath("~/App_Data/myXML-");
       string[] files = Directory.GetFiles(Server.MapPath("~/App_Data"), "*.xml", SearchOption.AllDirectories);
       //string path2 = this.TextBoxTeamName.Text;
       string path2 = Convert.ToString(files.Length+1);

       doc.Save(path1 + path2 + ".xml");

       Response.Redirect("~/Success.aspx?newfile=" + path1 + path2 + ".xml");


        }
    }
}
