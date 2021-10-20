using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Data.Linq;

namespace ToDo
{
    public partial class Todo_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
           
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["task_name"].DefaultValue = 
                ((TextBox)GridView1.FooterRow.FindControl("TaskName")).Text;
            SqlDataSource1.InsertParameters["due_date"].DefaultValue =
               ((TextBox)GridView1.FooterRow.FindControl("DueDate")).Text;
            SqlDataSource1.InsertParameters["date_added"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource1.InsertParameters["user_id"].DefaultValue = Session["user_id"].ToString();
            SqlDataSource1.Insert();
        }

        protected void LinkButton3_Click (object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            ToDoSqlDataContext db = new ToDoSqlDataContext();
            DateTime lastdate = db.Bargraphs.Where(x => x.date == DateTime.Today)
                .Take(1).Select(x => x.date).FirstOrDefault();
            if(lastdate==DateTime.Today)
            {
                Bargraph graph = db.Bargraphs.Single(x => x.date == DateTime.Today);
                graph.completed_task += 1;
                db.SubmitChanges();
            }
            else
            {
                Bargraph barobject = new Bargraph
                {
                    date = DateTime.Today,
                    completed_task = 1,
                    user_id = (int)Session["user_id"]
                };
                db.Bargraphs.InsertOnSubmit(barobject);
                db.SubmitChanges();
            }
            GridView1.DeleteRow(clickedRow.RowIndex); 
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
                
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PdfPTable ptable = new PdfPTable(GridView1.HeaderRow.Cells.Count);
            foreach (TableCell headerCell in GridView1.HeaderRow.Cells)
            {
                Font font = new Font();
                font.Color = new BaseColor(GridView1.HeaderStyle.ForeColor);
                PdfPCell pcell = new PdfPCell(new Phrase(headerCell.Text,font));
                pcell.BackgroundColor = new BaseColor(GridView1.HeaderStyle.BackColor);
                ptable.AddCell(pcell);
                
            }
            foreach (GridViewRow gridrow in GridView1.Rows)
            {
               
                foreach (TableCell tableCell in gridrow.Cells)
                {
                    PdfPCell pcell = new PdfPCell(new Phrase(tableCell.Text.Trim()));
                    ptable.AddCell(pcell);
                }
            }

            Document pdfdocument = new Document(PageSize.A4, 15f, 15f, 15f, 15f);
            PdfWriter.GetInstance(pdfdocument, Response.OutputStream);
            pdfdocument.Open();
            pdfdocument.Add(ptable);
            pdfdocument.Close();

            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=toDo.pdf") ;
            Response.Write(pdfdocument);
            Response.Flush();
            Response.End();
        }

        protected void Chart2_Load(object sender, EventArgs e)
        {

        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }
    }
}