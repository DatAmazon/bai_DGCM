using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DGCM_001
{
    public partial class Tools : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Reset()
        {
            txtID.Text = txtName.Text = txtNSX.Text = txtTL.Text = "";
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlDataSource11.Insert();
            Reset();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtID.Text = GridView1.SelectedRow.Cells[0].Text;
            txtName.Text = GridView1.SelectedRow.Cells[1].Text;
            txtNSX.Text = GridView1.SelectedRow.Cells[2].Text;
            txtTL.Text = GridView1.SelectedRow.Cells[3].Text;
            CheckBox1.Checked = false;
            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    CheckBox status = (row.Cells[4].FindControl("CheckBox1") as CheckBox);
            //    if(status.Checked == true)
            //    {
            //        CheckBox1.Checked = true;
            //    }
            //    else
            //    {
            //        CheckBox1.Checked = false;
            //    }
            //}


        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            SqlDataSource11.Update();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Reset();
        }
    }
}