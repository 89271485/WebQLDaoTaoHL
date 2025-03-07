using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class TaiKhoanDAO
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString;

        // Kiểm tra đăng nhập
        public TaiKhoan KiemTraDangNhap(string username, string password)
        {
            TaiKhoan tk = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT * FROM TaiKhoan WHERE Tendangnhap = @username AND Matkhau = @password";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    tk = new TaiKhoan
                    {
                        Tendangnhap = reader["Tendangnhap"].ToString(),
                        Matkhau = reader["Matkhau"].ToString(),
                        VaiTro = reader["VaiTro"].ToString().Trim()
                    };
                }

                conn.Close();
            }

            return tk;
        }

        // Đăng ký tài khoản
        public bool DangKyTaiKhoan(TaiKhoan tk)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "INSERT INTO TaiKhoan (Tendangnhap, Matkhau, VaiTro) VALUES (@username, @password, @vaitro)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", tk.Tendangnhap);
                cmd.Parameters.AddWithValue("@password", tk.Matkhau);
                cmd.Parameters.AddWithValue("@vaitro", tk.VaiTro);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                conn.Close();

                return result > 0;
            }
        }
        public bool CapNhatMatKhau(string username, string newPassword)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "UPDATE TaiKhoan SET Matkhau = @newPassword WHERE Tendangnhap = @username";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@newPassword", newPassword);
                cmd.Parameters.AddWithValue("@username", username);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                conn.Close();

                return result > 0; // Trả về true nếu có ít nhất 1 dòng bị ảnh hưởng
            }
        }
        public bool KiemTraTonTai(string username)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT COUNT(*) FROM TaiKhoan WHERE Tendangnhap = @username";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", username);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                conn.Close();

                return count > 0;
            }
        }

    }
}