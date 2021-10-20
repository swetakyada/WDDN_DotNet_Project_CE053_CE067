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
    public partial class ChangePassword : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox textBox1 = (TextBox)this.FindControl("TextBox1");
            TextBox textBox2 = (TextBox)this.FindControl("TextBox2");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM user_table WHERE user_id = @user_id", con);
                cmd.Parameters.AddWithValue("@user_id", Session["user_id"]);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    if (rd["password"].ToString() == textBox1.Text.Trim())
                    {
                        cmd = new SqlCommand("UPDATE user_table SET password = @password WHERE user_id = @user_id", con);
                        cmd.Parameters.AddWithValue("@password", textBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@user_id", Session["user_id"]);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Password Saved')</script>");
                        Response.Redirect("Profile.aspx");
                    }
                    else
                    {
                        con.Close();
                        Response.Write("<script>alert('Password not matched')</script>");
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }
    }
}