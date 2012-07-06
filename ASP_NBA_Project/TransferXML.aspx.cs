using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Schema;
using System.Xml.XPath;
using System.IO; 

namespace ASP_NBA_Project
{
    public partial class TransferXML : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private static bool isValid = true;
        private static string errorMessage;

        protected void ButtonSubmitTeam_Click(object sender, EventArgs e)
        {
            string dataPath = Server.MapPath("~/App_Data/");
            string filename = "myXML-" + this.TextBoxFileNumber.Text + ".xml";

             XmlReaderSettings readerSettings = new XmlReaderSettings();
                readerSettings.DtdProcessing = DtdProcessing.Parse;
                readerSettings.ValidationType = ValidationType.DTD;
                readerSettings.ValidationEventHandler += new ValidationEventHandler(this.ValidationEventHandler);
                try
                {
                    isValid = true;
                    errorMessage = string.Empty;

                    XmlReader reader = XmlReader.Create(dataPath + filename, readerSettings);
                    while (reader.Read()) { }
                    reader.Close();
                    
                }
                catch (ArgumentException ane)
                {
                    isValid = false;
                    errorMessage = ane.Message;
                }
                catch (FileNotFoundException fnfe)
                {
                    isValid = false;
                    errorMessage = fnfe.Message;
                }
                catch (UriFormatException ufe)
                {
                    isValid = false;
                    errorMessage = ufe.Message;
                }
                catch (XmlException xe)
                {
                    isValid = false;
                    errorMessage =  xe.Message;
                }


                // Check whether the document is valid or invalid.
                if (isValid)
                {

                    LiteralControl lic = new LiteralControl("<p class=\"success\">Документа : <b>" + filename + "</b> е валидиран успешно!</p>" + 
                        "<p class=\"success\">Документа : <b>" + filename + "</b> е прехвърлен в базата данни успешно!</p>");
                    PanelResults.Controls.Add(lic);
                }
                else
                {
                    LiteralControl lic = new LiteralControl("<p class=\"fail\">Грешка при валидирането на " + filename + "! : <b>" + errorMessage + "</b></p>");
                    PanelResults.Controls.Add(lic);
                }

            // XML to DB
            XmlDocument doc = new XmlDocument();
            doc.Load(dataPath + filename);

            nbaDBEntities nbaDB = new nbaDBEntities();

            Team newTeam = new Team();
            newTeam.name = doc.SelectSingleNode("//chap/team").InnerText;
            newTeam.wins = int.Parse(doc.SelectSingleNode("//chap/team").Attributes["wins"].Value);
            newTeam.loses = int.Parse(doc.SelectSingleNode("//chap/team").Attributes["loses"].Value);
            newTeam.playoffs = doc.SelectSingleNode("//chap/team").Attributes["playoffs"].Value;
            newTeam.in_division = doc.SelectSingleNode("//chap/team").Attributes["in_division"].Value;
            newTeam.history = doc.SelectSingleNode("//chap/history").InnerText;
            nbaDB.Teams.AddObject(newTeam);
           // nbaDB.SaveChanges();

            Achievment newAchievment = new Achievment();
            newAchievment.teamID = newTeam.teamID;
            newAchievment.division_titles = int.Parse(doc.SelectSingleNode("//chap/achievments/division_titles").InnerText);
            newAchievment.conference_titles = int.Parse(doc.SelectSingleNode("//chap/achievments/conference_titles").InnerText);
            newAchievment.league_titles = int.Parse(doc.SelectSingleNode("//chap/achievments/league_titles").InnerText);
            newAchievment.notable_people = doc.SelectSingleNode("//chap/achievments/notable_people").InnerText;
            nbaDB.Achievments.AddObject(newAchievment);

            Arena newArena = new Arena();
            newArena.teamID = newTeam.teamID;
            newArena.name = doc.SelectSingleNode("//chap/arena").InnerText;
            newArena.seats = int.Parse(doc.SelectSingleNode("//chap/arena").Attributes["seats"].Value);
            nbaDB.Arenas.AddObject(newArena);

            Player newPlayer = new Player();
            XmlNodeList nodeList = doc.SelectNodes("//chap/roster/player");
            foreach (XmlNode node in nodeList)
            {
                newPlayer.teamID = newTeam.teamID;
                newPlayer.name = node.InnerText;
                newPlayer.position = node.Attributes["position"].Value;
                nbaDB.Players.AddObject(newPlayer);
            }

            Free_Agents newFA = new Free_Agents();
            newFA.teamID = newTeam.teamID;
            newFA.name = doc.SelectSingleNode("//chap/free_agent").InnerText;
            newFA.match = doc.SelectSingleNode("//chap/free_agent/qual_offer").Attributes["matched"].Value;
            newFA.years_w_team = int.Parse(doc.SelectSingleNode("//chap/free_agent/years_w_team").InnerText);
            newFA.qual_offer = double.Parse(doc.SelectSingleNode("//chap/free_agent/qual_offer").InnerText);
            nbaDB.Free_Agents.AddObject(newFA);

            Star newStar = new Star();
            XmlNodeList nodeList2 = doc.SelectNodes("//chap/star");
            foreach (XmlNode node in nodeList2)
            {
                newStar.teamID = newTeam.teamID;
                newStar.name = node.SelectSingleNode("star_name").InnerText;
                newStar.years_pro = int.Parse(node.SelectSingleNode("years_pro").InnerText);
                newStar.salary = double.Parse(node.SelectSingleNode("salary").InnerText);
                newStar.avg_pts = double.Parse(node.SelectSingleNode("avg_pts").InnerText);
                nbaDB.Stars.AddObject(newStar);
            }

            Coach newCoach = new Coach();
            newCoach.teamID = newTeam.teamID;
            newCoach.name = doc.SelectSingleNode("//chap/coach").InnerText;
            newCoach.salary = double.Parse(doc.SelectSingleNode("//chap/coach").Attributes["salary"].Value);
            newCoach.has_title = doc.SelectSingleNode("//chap/coach").Attributes["has_title"].Value;
            newCoach.years_old = int.Parse(doc.SelectSingleNode("//chap/coach").Attributes["years_old"].Value);
            nbaDB.Coaches.AddObject(newCoach);

            Add_Info newAddInfo = new Add_Info();
            newAddInfo.teamID = newTeam.teamID;
            newAddInfo.owner = doc.SelectSingleNode("//chap/add_info/owner").InnerText;
            newAddInfo.manager = doc.SelectSingleNode("//chap/add_info/manager").InnerText;
            newAddInfo.site = doc.SelectSingleNode("//chap/add_info/site").InnerText;
            newAddInfo.colors = doc.SelectSingleNode("//chap/add_info/colors").InnerText;
            newAddInfo.value = double.Parse(doc.SelectSingleNode("//chap/add_info/value").InnerText);
            newAddInfo.draft_position = int.Parse(doc.SelectSingleNode("//chap/add_info/draft_position").InnerText);
            newAddInfo.dleague_affiliate = doc.SelectSingleNode("//chap/add_info/dleague_affiliate").InnerText;
            nbaDB.Add_Info.AddObject(newAddInfo);
            // Finally we save the data
            nbaDB.SaveChanges();

        }
        private void ValidationEventHandler(object sender, ValidationEventArgs args)
        {
            isValid = false;
            errorMessage = args.Message;
        }
    }
}