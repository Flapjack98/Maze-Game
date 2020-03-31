using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maze_Game
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected SqlConnection sqlConnection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=MazeGameDatabase;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void UserLogin_Click(object sender, EventArgs e)
        {
            User user = GetUserFromDatabase(Username.Text);
            if (user == null || !user.Username.Equals(Username.Text, StringComparison.Ordinal) || !user.Password.Equals(Password.Text, StringComparison.Ordinal))
            {
                Prompt.Text = "Invalid username or password.";
                Prompt.ForeColor = Color.Red;
                return;
            }
            Prompt.Text = "Welcome, " + Username.Text + "!";
            Prompt.ForeColor = Color.Black;
        }

        protected void UserCreate_Click(object sender, EventArgs e)
        {
            string username = Username.Text;
            User user = GetUserFromDatabase(username);
            if (user != null)
            {
                Prompt.Text = "User " + user.Username + " already exists!";
                Prompt.ForeColor = Color.Red;
                return;
            }
            sqlConnection.Open();
            string password = Password.Text;
            string commandString
                = "INSERT INTO [User] (Username, Password) VALUES ('"
                + username + "'" + ", " + "'" + password + "')";
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandText = commandString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.SelectCommand.ExecuteNonQuery();
            sqlConnection.Close();
            Prompt.Text = "New user created Successfully!";
            Prompt.ForeColor = Color.Black;
        }

        private User GetUserFromDatabase(string username)
        {
            sqlConnection.Open();
            string commandString
                    = "SELECT * FROM [User] WHERE Username = '"
                    + username + "'";
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandText = commandString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            if (dataTable.Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow dataRow = dataTable.Rows[0];
                return new User(dataRow.Field<int>("Id"),
                    dataRow.Field<string>("Username"),
                    dataRow.Field<string>("Password"));
            }
        }
    }
}