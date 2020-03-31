<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Maze_Game.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="text-align:center">
        <div style="display:inline-block">
            <div>
                Username:
            </div>
            <div>
                <div><asp:TextBox ID="Username" placeholder="Enter your username" runat="server"/></div>
                <div><asp:RequiredFieldValidator runat="server" ForeColor="Red" ID="UsernameValidate" ControlToValidate="Username" errormessage="Please enter a username!" /></div>
            </div>
        </div>
        <div style="margin-left:auto; margin-right:auto; margin-top:20px; width:50%">
            <div>
                Password:
            </div>
            <div>
                <div><asp:TextBox ID="Password" placeholder="Enter your password" runat="server" /></div>
                <div><asp:RequiredFieldValidator runat="server" ForeColor="Red" ID="PasswordValidate" ControlToValidate="Password" errormessage="Please enter a password!" /></div>
            </div>
        </div>
        <div style="margin-top:20px; display:inline-block">
            <div style="float:left">
                <asp:Button ID="UserLogin" Text="Login" runat="server" onClick="UserLogin_Click" />
            </div>
            <div style="margin-left:50px; float:left">
                <asp:Button ID="UserCreate" Text="Create User" runat="server" onClick="UserCreate_Click" />
            </div>
        </div>
    </form>
</body>
</html>
