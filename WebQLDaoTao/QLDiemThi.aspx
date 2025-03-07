<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLDiemThi.aspx.cs" Inherits="WebQLDaoTao.QLDiemThi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>NHẬP ĐIỂM THI</h2>
    <hr />
    <div style="padding:10px">
        Chọn Môn Học <asp:DropDownList ID="ddlMonHoc" runat="server" DataSourceID="odsMonHoc"
            DataTextField="TenMH" DataValueField="MaMH" AutoPostBack="True"></asp:DropDownList>
    </div>
    <asp:GridView ID="gvKetQua" runat="server" AutoGenerateColumns="False" 
        DataSourceID="odsKetQua" CssClass="table table-bordered" Width="70%" DataKeyNames="Id" OnRowDataBound="gvKetQua_RowDataBound">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="MaSV" ControlStyle-Width="80px" />
            <asp:BoundField DataField="Hotensv" HeaderText="Họ tên sinh viên" ControlStyle-Width="80px" SortExpression="MaSV" />
            <asp:TemplateField  HeaderText="Điểm Thi">
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("Diem") %>'></asp:TextBox>
                </ItemTemplate>
               <%-- <FooterTemplate>
                    <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="btn btn-primary" OnClick="btnLuu_Click" />
                </FooterTemplate>--%>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Tác Vụ Xóa">
                <HeaderTemplate>
                    <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkRow" runat="server" />
                </ItemTemplate>
                <%-- <FooterTemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Xóa đã chọn" CssClass="btn btn-danger" OnClick="btnDelete_Click1" />
                </FooterTemplate>--%>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                Hiện không có sinh viên đăng ký học phần này
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="btn btn-primary" OnClick="btnLuu_Click" />
     <asp:Button ID="btnDelete" runat="server" Text="Xóa đã chọn" CssClass="btn btn-danger" OnClick="btnDelete_Click1" />
    <asp:ObjectDataSource ID="odsKetQua" runat="server" SelectMethod="getByMaMH" TypeName="WebQLDaoTao.Models.KetQuaDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMonHoc" Name="mamh" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMonHoc" runat="server" 
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.MonHocDAO"></asp:ObjectDataSource>
</asp:Content>
