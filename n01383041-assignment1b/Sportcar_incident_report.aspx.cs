using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace n01383041_assignment1b
{
    public partial class WebForm1: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                Page.Validate();

                if (Page.IsValid)
                {
                    string clientFirstName = aspx_client_fname.Text;
                    string clientLastName = aspx_client_lname.Text;
                    string clientEmail = aspx_client_email.Text;
                    string clientPhoneNumber = aspx_client_phonenumber.Text.ToString();
                    string incidentTime = aspx_incident_time.SelectedValue;
                    int vehiclesInIncident = Convert.ToInt32(aspx_incident_number_of_vehicles.Text);
                    string typeOfCar = aspx_car_type.Text;
                    string clientLicense = aspx_client_license.Text;

                    confirmbox.InnerHtml = "Thanks for submitting an incident report " + clientFirstName + " " + clientLastName + "<br>";
                    confirmbox.InnerHtml += "We will keep in touch through your email: " + clientEmail + ", or by phone at: " + clientPhoneNumber + "<br>";
                    confirmbox.InnerHtml += "To summerize: The incident took place inbetween " + incidentTime + " and there were " + vehiclesInIncident + " vehicle(s) involved <br>";
                    if (typeOfCar != "other")
                    {
                        confirmbox.InnerHtml += "Your license level is " + clientLicense + " and your vehicles is a " + typeOfCar + "<br>";
                    }
                    else
                    {
                        confirmbox.InnerHtml += "Your license level is " + clientLicense + " and you aren't sure what type of vehicle you drive<br>";
                    }
                    if(vehiclesInIncident < 3)
                    {
                        confirmbox.InnerHtml += "The incident has been Resolved";
                    }else if(vehiclesInIncident > 6)
                    {
                        
                        confirmbox.InnerHtml += "THE INCIDENT REQUIRES URGENT ATTENTION";
                    }
                    else{
                        confirmbox.InnerHtml += "The incident will be Pending an Investigation";
                    }
                }
            }
        }
    }
}