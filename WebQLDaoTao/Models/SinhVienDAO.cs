using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class SinhVienDAO
    {
        /// đọc danh sách sinh viên <summary>
        public List<SinhVien> getAll()
        {
            List<SinhVien> dsSinhVien = new List<SinhVien>();
            //Mở kết nối CSDL
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("select * from SinhVien", conn);
            //3.thuc thi ket qua;
            SqlDataReader dr = cmd.ExecuteReader();
            //4.Xử lý kết quả trả về
            while (dr.Read())
            {
                //tao doi tuong sinh vien
                SinhVien sv = new SinhVien
                {
                    MaSV = dr["Masv"].ToString(),
                    HoSV = dr["Hosv"].ToString(),
                    TenSV = dr["Tensv"].ToString(),
                    GioiTinh = Boolean.Parse(dr["gioitinh"].ToString()),
                    NgaySinh = DateTime.Parse(dr["ngaysinh"].ToString()),
                    NoiSinh = dr["noisinh"].ToString(),
                    DiaChi = dr["diachi"].ToString(),
                    MaKH = dr["Makh"].ToString(),
                };
                //add vao dsSinhVien
                dsSinhVien.Add(sv);
             }
            return dsSinhVien;
        }
        //phuong thuc cập nhật thông tin sinh vien vao CSDL
        public int Update(SinhVien sv)
        {
            //1.Mo ket noi CSDL
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("update sinhvien set hosv=@hosv, tensv=@tensv, gioitinh=@gioitinh,ngaysinh = @ngaysinh, noisinh = @noisinh, diachi = @diachi, makh = @makh where masv = @masv", conn);
            cmd.Parameters.AddWithValue("@masv", sv.MaSV);
            cmd.Parameters.AddWithValue("@hosv", sv.HoSV);
            cmd.Parameters.AddWithValue("@tensv", sv.TenSV);
            cmd.Parameters.AddWithValue("@gioitinh", sv.GioiTinh);
            cmd.Parameters.AddWithValue("@ngaysinh", sv.NgaySinh);
            cmd.Parameters.AddWithValue("@noisinh", sv.NoiSinh);
            cmd.Parameters.AddWithValue("@diachi", sv.DiaChi);
            cmd.Parameters.AddWithValue("@makh", sv.MaKH);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }

        //Phương thức xóa
        public int Delete(SinhVien sv)
        {
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("delete from sinhvien where masv=@masv", conn);
            cmd.Parameters.AddWithValue("@masv", sv.MaSV);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
        //.....
        //phuong thuc them sinh vien vao CSDL
        public int Insert(SinhVien sv)
        {
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["QLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("insert into sinhvien (masv, hosv, tensv, gioitinh, ngaysinh, noisinh, diachi, makh) values(@masv, @hosv, @tensv, @gioitinh, @ngaysinh, @noisinh, @diachi, @makh)",
        conn);
            cmd.Parameters.AddWithValue("@masv", sv.MaSV);
            cmd.Parameters.AddWithValue("@hosv", sv.HoSV);
            cmd.Parameters.AddWithValue("@tensv", sv.TenSV);
            cmd.Parameters.AddWithValue("@gioitinh", sv.GioiTinh);
            cmd.Parameters.AddWithValue("@ngaysinh", sv.NgaySinh);
            cmd.Parameters.AddWithValue("@noisinh", sv.NoiSinh);
            cmd.Parameters.AddWithValue("@diachi", sv.DiaChi);
            cmd.Parameters.AddWithValue("@makh", sv.MaKH);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
    }
}