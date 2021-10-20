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
    public partial class login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT user_id FROM user_table WHERE user_email='"+ Textbox1.Text.Trim() +"'  And Password='" + Textbox2.Text.Trim() + "' ", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if(rd.HasRows)
                {
                    if (rd.Read())
                    {
                        Session["user_id"] = rd["user_id"];
                        Response.Redirect("Todo_Dashboard.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Login Details')</script>");
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}