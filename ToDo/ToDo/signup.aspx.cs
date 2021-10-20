using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDo
{
    public partial class signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO user_table(username,user_email,password) values(@username,@user_email,@password)", con);

                cmd.Parameters.AddWithValue("@username", Textbox3.Text.Trim());
                cmd.Parameters.AddWithValue("@user_email", Textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@password", Textbox2.Text.Trim());
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('signup successful')</script>");
                Response.Redirect("/login.aspx");
            }
            catch(Exception ex){

                Response.Write("<script>alert('" + ex.Message +"')</script>");
            }

        }

        protected void Textbox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}