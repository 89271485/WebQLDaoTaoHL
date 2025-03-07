<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h5 class="alert alert-success">QUẢN LÝ KHOA</h5>
    <hr />
    <div>
        <button type="button" class="btn btn-info btn-lg" style="margin-bottom: 5px;" data-toggle="modal" data-target="#modalOpenAddButton">Thêm mới</button>
        <!-- Modal -->
        <div class="modal fade" id="modalOpenAddButton" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">THÊM MỚI KHOA</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <div class="form-group">
                                <label>Mã khoa</label>
                                <asp:TextBox ID="txtMaKH" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Tên khoa</label>
                                <asp:TextBox ID="txtTenKH" CssClass="form-control" runat="server" ControlToValidate="txtTenmh"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:Button ID="btnThem" class="btn btn-success" OnClick="btnThem_Click" runat="server" Text="Thêm" />
                            </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="vsKq" runat="server" ForeColor="#FF3300" Font-Size="Medium" />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Huỷ</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<asp:GridView ID="gvKhoa" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False"
    DataSourceID="ods_Khoa" DataKeyNames="MaKH" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White"/>
    <Columns>
            <asp:BoundField DataField="MaKH" HeaderText="Mã Khoa" SortExpression="MaKH" ReadOnly="true" />
            <asp:BoundField DataField="TenKH" HeaderText="Tên khoa" SortExpression="TenKH" />
            <asp:CommandField ButtonType="Button" HeaderText="Chọn tác vụ" ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
    <asp:ObjectDataSource ID="ods_Khoa" runat="server" DataObjectTypeName="WebQLDaoTao.Models.Khoa" DeleteMethod="Delete" InsertMethod="Insert"
        SelectMethod="getAll" TypeName="WebQLDaoTao.Models.KhoaDAO" UpdateMethod="Update" 
       
        >
        <InsertParameters>
            <asp:Parameter Name="makh" Type="String" />
            <asp:Parameter Name="tenkh" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="makh" Type="String" />
            <asp:Parameter Name="tenkh" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    </asp:Content>
