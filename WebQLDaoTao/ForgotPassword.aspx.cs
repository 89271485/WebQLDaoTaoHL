using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        TaiKhoanDAO dao = new TaiKhoanDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Kiểm tra dữ liệu đầu vào
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "Mật khẩu xác nhận không khớp.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Kiểm tra tài khoản tồn tại
            if (!dao.KiemTraTonTai(username))
            {
                lblMessage.Text = "Tên đăng nhập không tồn tại.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Cập nhật mật khẩu mới
            bool result = dao.CapNhatMatKhau(username, newPassword);

            if (result)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Mật khẩu đã được cập nhật thành công!";
                Response.Redirect("Login.aspx");

            }
            else
            {
                lblMessage.Text = "Cập nhật mật khẩu thất bại.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}