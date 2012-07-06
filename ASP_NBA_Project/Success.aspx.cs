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
    public partial class Success : System.Web.UI.Page
    {

        private static bool isValid = true;
        private static string errorMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            string filename = Request.QueryString["newfile"];
            string dataPath = Server.MapPath("~/App_Data/");

            XmlReaderSettings readerSettings = new XmlReaderSettings();
            readerSettings.DtdProcessing = DtdProcessing.Parse;
            readerSettings.ValidationType = ValidationType.DTD;
            readerSettings.ValidationEventHandler += new ValidationEventHandler(this.ValidationEventHandler);
            try
            {
                isValid = true;
                errorMessage = string.Empty;

                XmlReader reader = XmlReader.Create(filename, readerSettings);
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
                errorMessage = xe.Message;
            }


            // Check whether the document is valid or invalid.
            if (isValid)
            {

                LiteralControl lic = new LiteralControl("<p class=\"success\">Документа : <b>" + filename + "</b> е валидиран успешно!</p>");
                PanelResults.Controls.Add(lic);
            }
            else
            {
                LiteralControl lic = new LiteralControl("<p class=\"fail\">Грешка при валидирането на " + filename + "! : <b>" + errorMessage + "</b></p>");
                PanelResults.Controls.Add(lic);
            }

        }



        private void ValidationEventHandler(object sender, ValidationEventArgs args)
        {
            isValid = false;
            errorMessage = args.Message;
        }
    }
}
        
    
