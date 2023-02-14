using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DGCM_001
{
    public partial class mvip : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["db_bai_duc"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnChange_Click(object sender, EventArgs e)
        {
            string oldpass = txtOldPass.Text.Trim();
            string newpass = txtNewPass.Text.Trim();
            if (newpass.Equals(oldpass))
            {
                Label1.Text = "new pass and old pass must be diffirent";
            }
            else
            {
                using (SqlConnection cnn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = cnn.CreateCommand())
                    {

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.CommandText = "check2";
                        cmd.Parameters.AddWithValue("@pass", txtOldPass.Text);
                        cnn.Open();
                        SqlDataReader rd = cmd.ExecuteReader();
                        if (rd.HasRows)
                        {
                            ChangPass(txtNewPass.Text);
                        }
                        cnn.Close();
                    }
                }
            }
        }
        public void ChangPass(string pass)
        {
            using (SqlConnection cnn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = cnn.CreateCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "updatePass";
                    cmd.Parameters.AddWithValue("@pass", pass);
                    cnn.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        Label1.Text = "Đổi mật khẩu thành công";
                    }
                    else
                    {
                        Label1.Text = "Đổi mật khẩu thất bại";
                    }
                    cnn.Close();
                }
            }
        }
    }
}