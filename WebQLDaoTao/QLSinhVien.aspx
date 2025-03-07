<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h1>Nội Dung Quản Lý Trang Sinh Viên</h1>
    <hr />
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm mới sinh viên</button>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm mới sinh viên</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Mã sinh viên</label>
                        <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-inline">
                        <label>Họ sinh viên</label>
                        <asp:TextBox ID="txtHoSV" runat="server" CssClass="form-control" Width="100px"></asp:TextBox>
                         <label>Tên sinh viên</label>
                        <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control" Width="50px"></asp:TextBox>
                    </div>
                    <div class="form-inline">
                        <label>Phái</label>
                        <asp:RadioButton ID="rdNam" runat="server" Text="Nam" GroupName="GT" Checked="true" />
                         <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" GroupName="GT" Checked="true" />
                    </div>
                    <div class="form-group">
                        <label>Ngày sinh</label>
                        <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Nơi sinh</label>
                        <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ</label>
                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Chọn khoa</label>
                        <asp:DropDownList ID="ddlKhoa" runat="server" CssClass="form-control"
                            DataSourceID="odsKhoa" DataTextField="tenkh" DataValueField="makh">
                            </asp:DropDownList>
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button ID="btThem" runat="server" Text="Lưu" OnClick="btXuLy_Click" CssClass="btn btn-success"></asp:Button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>


    <div class="table-responsive">
        <asp:GridView ID="gvSinhVien" runat="server" DataSourceID="odsSinhVien" AutoGenerateColumns="False" DataKeyNames="MaSV"
            CssClass="table table-bordered table-hover" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã SV" ControlStyle-Width="80px" ReadOnly="true" />
                <asp:BoundField DataField="hosv" HeaderText="Họ SV" ControlStyle-Width="90px" ControlStyle-CssClass="form-control" />
                <asp:BoundField DataField="tensv" HeaderText="Tên SV" ControlStyle-Width="90px" ControlStyle-CssClass="form-control" />

                <asp:TemplateField HeaderText="Phái">
                    <EditItemTemplate>
                        <asp:DropDownList ID="gioitinh" runat="server" CssClass="form-control" SelectedValue='<%# Bind("gioitinh") %>'>
                            <asp:ListItem Text="Nam" Value="True"></asp:ListItem>
                            <asp:ListItem Text="Nữ" Value="False"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# (bool) Eval("gioitinh")?"Nam":"Nữ" %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ngaysinh" HeaderText="Ngày Sinh" DataFormatString="{0: dd/MM/yyyy}" />
                <asp:BoundField DataField="noisinh" HeaderText="Nơi Sinh" />
                <asp:BoundField DataField="diachi" HeaderText="Địa Chỉ" />
                <asp:TemplateField HeaderText="Khoa">
                    <ItemTemplate>
                        <%# Eval("Makh") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="makh" runat="server"
                            DataSourceID="odsKhoa" DataTextField="TenKH" DataValueField="MaKH"
                            SelectedValue='<%# Bind("MaKH") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Chức năng">
                    <ItemTemplate>
                        <asp:Panel ID="pnlChucNang" runat="server">
                            <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Contents/Images/Images/edit.gif" CommandName="Edit" />
                            <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Contents/Images/Images/delete.gif" CommandName="Delete" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?');" />
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="pager-style" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="odsSinhVien" runat="server"
        DataObjectTypeName="WebQLDaoTao.Models.SinhVien"
        DeleteMethod="Delete"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.SinhVienDAO"
        UpdateMethod="Update"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsKhoa" runat="server"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.KhoaDAO"></asp:ObjectDataSource>
</asp:Content>
