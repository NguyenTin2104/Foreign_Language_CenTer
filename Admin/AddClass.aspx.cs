using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static QuanLyTTNN.Models.CommonFn;

namespace QuanLyTTNN.Admin
{
    public partial class AddClass : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
            }
        }
        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], MaPhong, TenPhong from Phong");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from Phong where TenPhong = '" + txtClass.Text.Trim() + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Phong values ('" + txtClass.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Succesffully";
                    lblMsg.CssClass = "alert alert-success";
                    txtClass.Text = string.Empty;
                    GetClass();
                }
                else 
                {
                    lblMsg.Text = "Entered class already exists!";
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}