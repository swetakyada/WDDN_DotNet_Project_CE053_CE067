using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDo
{
    public partial class EditProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        TextBox textBox1, textBox2;
        protected void Page_Load(object sender, EventArgs e)
        {
            textBox1 = (TextBox)this.FindControl("TextBox1");
            textBox2 = (TextBox)this.FindControl("TextBox2");
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
                    textBox1.Text = rd["username"].ToString();
                    textBox2.Text = rd["user_email"].ToString();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
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
                SqlCommand cmd = new SqlCommand("UPDATE user_table SET username = @username, user_email = @user_email WHERE user_id = @user_id", con);

                cmd.Parameters.AddWithValue("@username", textBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@user_email", textBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@user_id", Session["user_id"]);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Details Saved')</script>");
                Response.Redirect("Profile.aspx");
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