<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sportcar_incident_report.aspx.cs" Inherits="n01383041_assignment1b.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sportscar Incident Report</title>
</head>
<body>
    <h1>Car Incident Report</h1>
    <form id="form1" runat="server">
        <div>
            <h2>Please fill out the information below:</h2>
            <section>
                <label>First Name:</label>
                <asp:TextBox runat="server" ID="aspx_client_fname" placeholder="e.g. Gavin"></asp:TextBox>
                <asp:RequiredFieldValidator
                    runat="server"
                    EnableClientScript="true"
                    ErrorMessage="Please State Your First Name"
                    ControlToValidate="aspx_client_fname">
                </asp:RequiredFieldValidator>
                <div>
                    <label>Last Name:</label>
                    <asp:TextBox runat="server" ID="aspx_client_lname" placeholder="e.g. Smith"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        runat="server"
                        EnableClientScript="true"
                        ErrorMessage="Please State Your Last Name"
                        ControlToValidate="aspx_client_lname">
                    </asp:RequiredFieldValidator>
                </div>
                <div>
                    <%/*
                       * I found this Regular expression by Thor Larholm on 
                       * 09/22/2019 for checking emails with variable domains
                       * on this URL:http://regexlib.com/Search.aspx?k=email&c=1&m=-1&ps=20
                       */%>
                    <label>E-mail Address:</label>
                    <asp:TextBox runat="server" ID="aspx_client_email" placeholder="g.smith@me.com"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        runat="server"
                        ControlToValidate="aspx_client_email" 
                        ErrorMessage="Please enter an e-mail"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator 
                        runat="server"
                        EnableClientScript="true"
                        ControlToValidate="aspx_client_email"
                        ErrorMessage="Please enter a valid e-mail."
                        ValidationExpression="^.+@[^\.].*\.[a-z]{2,}$"
                        Display="Dynamic">                         
                    </asp:RegularExpressionValidator>
                </div>
                <div>
                    <%/*
                       * I found this Regular expression by Christine Bittle on 
                       * 09/22/2019 for checking phone numbers
                       * on a lesson Visual Studios Project
                       */%>
                    <label>Phone Number:</label>
                    <asp:TextBox runat="server" ID="aspx_client_phonenumber" placeholder="905-999-5555"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        runat="server"
                        ControlToValidate="aspx_client_phonenumber" 
                        ErrorMessage="Please enter a phone number"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator 
                        runat="server"
                        EnableClientScript="true"
                        ControlToValidate="aspx_client_phonenumber"
                        ErrorMessage="Please enter a valid phone number."
                        ValidationExpression="[(]{0,1}[0-9]{3}[)]{0,1}(\s*|\-+)[0-9]{3}(\s*|\-+)[0-9]{4}"
                        Display="Dynamic">
                    </asp:RegularExpressionValidator>
                </div>
            </section>
            <section>
                <h2>About the Incident</h2>
                <h3>What time did the incident take place?</h3>
                <asp:DropDownList runat="server" ID="aspx_incident_time">
                    <asp:ListItem Text="-- Choose One --" Value=""></asp:ListItem>
                    <asp:ListItem Text="00:01-06:00" Value="midnight-6am"></asp:ListItem>
                    <asp:ListItem Text="06:01-12:00" Value="6am-noon"></asp:ListItem>
                    <asp:ListItem Text="12:01-18:00" Value="noon-6pm"></asp:ListItem>
                    <asp:ListItem Text="18:01-00:00" Value="6pm-midnight"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    runat="server"
                    EnableClientScript="true"
                    ErrorMessage="Please Select the time of the incident"
                    ControlToValidate="aspx_incident_time">
                </asp:RequiredFieldValidator>

                <h3><label>How many vehicles were involved in the incident?</label></h3>
                <asp:TextBox runat="server" ID="aspx_incident_number_of_vehicles"></asp:TextBox>
                <asp:RequiredFieldValidator
                    runat="server"
                    ControlToValidate="aspx_incident_number_of_vehicles" 
                    ErrorMessage="Please state the number of vehicles involved in the incident between 1 and 9"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RangeValidator
                    runat="server"
                    EnableClientScript="true"
                    ErrorMessage="Please state the number of vehicles involved in the incident between 1 and 9"
                    Type="Integer"
                    MinimumValue="1"
                    MaximumValue="9"
                    ControlToValidate="aspx_incident_number_of_vehicles"
                    Display="Dynamic">                    
                </asp:RangeValidator>
                
                <h3>What type of vehicle was being driven when the incident happened?</h3>
                <asp:RadioButtonList runat="server" ID="aspx_car_type">
                    <asp:ListItem Text="Sedan" Value="Sedan"></asp:ListItem>
                    <asp:ListItem Text="S.U.V" Value="S.U.V"></asp:ListItem>
                    <asp:ListItem Text="Crossover" Value="Crossover"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator
                    runat="server"
                    EnableClientScript="true"
                    ErrorMessage="Please Select the type of vehicle that was being drive. If you aren't sure, select 'Other'"
                    ControlToValidate="aspx_car_type">
                </asp:RequiredFieldValidator>
            </section>
            <section>
                <h2>More Info</h2>
                <h3>What level is your driver's license</h3>
                <asp:RadioButtonList runat="server" ID="aspx_client_license">
                    <asp:ListItem Text="G1 " Value="G1"></asp:ListItem>
                    <asp:ListItem Text="G2 " Value="G2"></asp:ListItem>
                    <asp:ListItem Text="G " Value="G"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator
                    runat="server"
                    EnableClientScript="true"
                    ErrorMessage="Please Select your current license"
                    ControlToValidate="aspx_client_license">
                </asp:RequiredFieldValidator>

                <h3>Please select all that apply:</h3>
                <asp:CheckBoxList runat="server" ID="aspx_client_statements">
                    <asp:ListItem Text="Are you a citizen or Permenant Resident of this country?" Value="aspx_client_is_citizen"></asp:ListItem>
                    <asp:ListItem Text="Have you been in an incident within the last 5 years?" Value="aspx_client_had_incident"></asp:ListItem>
                    <asp:ListItem Text="Is the vehicle registered under the name stated above?" Value="aspx_is_registered_under_name"></asp:ListItem>
                </asp:CheckBoxList>
                <h3>How would you prefer to be contacted moving forward?</h3>
                <asp:CheckBoxList runat="server" ID="aspx_client_contact">
                    <asp:ListItem Text="By Email stated above." Value="aspx_contact_email"></asp:ListItem>
                    <asp:ListItem Text="By Phone number stated above" Value="aspx_contact_phone"></asp:ListItem>
                </asp:CheckBoxList>
            </section>
            <section>
                <asp:ValidationSummary runat="server" ShowSummary="true" />
            </section>
            <section id="confirmbox" runat="server">
            </section>
            <section>
                <input type="submit" value="submit" />
            </section>

        </div>
    </form>
</body>
</html>

