using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DGCM_001
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            layDSSP();
        }
        public void layDSSP()
        {
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("select * from tblSanpham", Cnn))
                {
                    Cmd.CommandType = CommandType.Text;
                    Cnn.Open();
                    using (SqlDataReader reader = Cmd.ExecuteReader())
                    {
                        dgv.DataSource = reader;
                        dgv.DataBind();
                        
                    }
                    Cnn.Close();
                }
            }

            //repeater
            using (SqlConnection Cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand Cmd = new SqlCommand("select * from tblSanpham", Cnn))
                {
                    Cmd.CommandType = CommandType.Text;
                    Cnn.Open();
                    using (SqlDataReader reader = Cmd.ExecuteReader())
                    {
                        Repeater1.DataSource = reader;
                        Repeater1.DataBind();

                    }
                    Cnn.Close();
                }
            }



        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "themSP";
                    cmd.Parameters.AddWithValue("@PK_SanphamID", txtID.Text);
                    cmd.Parameters.AddWithValue("@TenSanPham", txtName.Text);
                    cmd.Parameters.AddWithValue("@NamSanXuat", txtNSX.Text);
                    cmd.Parameters.AddWithValue("@Trongluong", txtTL.Text);
                    if (CheckBox1.Checked)
                    {
                        cmd.Parameters.AddWithValue("@Devo", true);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Devo", false);
                    }

                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        lblErrorPass.Text = "Thêm thất bại";
                    }
                    else
                    {
                        lblErrorPass.Text = "Thêm thành công";
                    }
                    cnn.Close();

                }
            }
            layDSSP();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        //protected void dgv_SelectedIndexChanged(object sender, EventArgs e)
        //{
            //txtID.Text = dgv.SelectedRow.Cells[0].Text.ToString();
            //txtName.Text = dgv.SelectedRow.Cells[1].Text.ToString();
            //txtNSX.Text = dgv.SelectedRow.Cells[2].Text.ToString();
            //txtTL.Text = dgv.SelectedRow.Cells[3].Text.ToString();



            //CheckBox1.Checked = dgv.SelectedRow.Cells[4].Wrap;
            //lblErrorPass.Text = dgv.SelectedRow.Cells[1].Text.ToString();
        //}

        protected void btnSua_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "suaSP";
                    cmd.Parameters.AddWithValue("@PK_SanphamID", txtID.Text);
                    cmd.Parameters.AddWithValue("@TenSanPham", txtName.Text);
                    cmd.Parameters.AddWithValue("@NamSanXuat", txtNSX.Text);
                    cmd.Parameters.AddWithValue("@Trongluong", txtTL.Text);
                    cmd.Parameters.AddWithValue("@Devo", CheckBox1.Checked);
                    cnn.Open();
                    int result = cmd.ExecuteNonQuery();
                }
            }
            layDSSP();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "xoaSP";
                    cnn.Open();
                    cmd.Parameters.AddWithValue("@PK_SanphamID", txtID.Text);
                    int i = cmd.ExecuteNonQuery();
                    if (i == 0)
                    {
                        lblErrorPass.Text = "xóa thất bại";
                    }
                    else
                    {
                        lblErrorPass.Text = "xóa thành công";
                    }

                    cnn.Close();
                }
            }
        }

        

        protected void dgv_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label idsp = (Label)dgv.SelectedRow.FindControl("IDSP");
            Label Name = (Label)dgv.SelectedRow.FindControl("Name");
            Label NSX = (Label)dgv.SelectedRow.FindControl("NSX");
            Label Trongluong = (Label)dgv.SelectedRow.FindControl("Trongluong");
            txtID.Text = idsp.Text.ToString();
            txtName.Text = Name.Text.ToString();
            txtNSX.Text = NSX.Text.ToString();
            txtTL.Text = Trongluong.Text.ToString();
            CheckBox chk = (CheckBox)dgv.SelectedRow.FindControl("dgv_Ck");

            if (chk.Checked)
                CheckBox1.Checked = true;
            else
                CheckBox1.Checked = false;
        }

        protected void dgv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch(e.Row.RowType)
            {
                case DataControlRowType.Header:
                    break;
                case DataControlRowType.DataRow:
                    e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(this.dgv, "Select$" + e.Row.RowIndex));
                 //   CheckBox chk = (CheckBox)e.Row.FindControl("dgv_Ck");
                 //   HiddenField hd1 = (HiddenField)e.Row.FindControl("hidden1");
                  //  string a = hd1.Value;
                 //   txtTL.Text = a;
                    break;

            }    
        }
    }

}
//txtID.Text = GridView1.SelectedRow.Cells[0].Text;
//txtName.Text = GridView1.SelectedRow.Cells[1].Text;
//txtNSX.Text = GridView1.SelectedRow.Cells[2].Text;
//txtTL.Text = GridView1.SelectedRow.Cells[3].Text;