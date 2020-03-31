<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Maze_Game.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="text-align:center">
        <div style="margin:auto">
            <div>
                Username:
            </div>
            <div style="margin-top:5px">
                <div><asp:TextBox ID="Username" placeholder="Enter your username" runat="server"/></div>
                <div><asp:RequiredFieldValidator runat="server" ForeColor="Red" ID="UsernameValidate" ControlToValidate="Username" errormessage="Please enter a username!" /></div>
            </div>
        </div>
        <div style="margin:auto; margin-top:20px">
            <div>
                Password:
            </div>
            <div style="margin-top:5px">
                <div><asp:TextBox ID="Password" placeholder="Enter your password" runat="server" /></div>
                <div><asp:RequiredFieldValidator runat="server" ForeColor="Red" ID="PasswordValidate" ControlToValidate="Password" errormessage="Please enter a password!" /></div>
            </div>
        </div>
        <div style="margin:auto; margin-top:20px">
            <div style="display:inline">
                <asp:Button ID="UserLogin" Text="Login" runat="server" onClick="UserLogin_Click" />
            </div>
            <div style="display:inline; margin-left:20px">
                <asp:Button ID="UserCreate" Text="Create User" runat="server" onClick="UserCreate_Click" />
            </div>
        </div>
        <div style="margin:auto; margin-top:20px">
            <div><asp:Label ID="Prompt" Text="" runat="server" /></div>
        </div>
    </form>
</body>
</html>
