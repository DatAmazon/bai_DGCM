<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tools.aspx.cs" Inherits="DGCM_001.Tools" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div>
                <p>
                    Mã sản phẩm:&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtID" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtID" ErrorMessage="ID sp k được để trống"
                        ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                    <%--               <asp:RegularExpressionValidator ID="reguName" runat="server" ControlToValidate="txtName" ValidationExpression="[a-zA-Z][a-zA-Z0-9]{2,3}"
                    ErrorMessage="Tối thiểu phải 3 ký tự và không chứa ký tự đặc biệt" ForeColor="Red" ValidationGroup="checkGroup"  Display="None"></asp:RegularExpressionValidator>--%>
                    <%--    <asp:RegularExpressionValidator ID="reguName" runat="server" ValidationExpression=".{3,}" Display="None"
                    ControlToValidate="txtName" ErrorMessage="Tài khoản tối thiểu 3 ký tự" ForeColor="Red" ValidationGroup="checkGroup"></asp:RegularExpressionValidator>--%>
                </p>
                <p>
                    Tên sản phẩm:&nbsp;&nbsp;
                <%--<asp:TextBox ID="txtPass" runat="server" Width="184px" TextMode="Password"></asp:TextBox>--%>

                    <asp:TextBox ID="txtName" runat="server" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rePass" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Tên sp không được để trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                    <%-- <asp:RegularExpressionValidator ID="reguPass" runat="server" ValidationExpression=".{3,}" Display="None"
                    ControlToValidate="TxtPass" ErrorMessage="Mật khẩu tối thiểu 3 ký tự" ForeColor="Red" ValidationGroup="checkGroup"></asp:RegularExpressionValidator>--%>
                </p>
                <p>
                    Năm sản xuất:&nbsp;&nbsp;&nbsp;
                <%--<asp:TextBox ID="txtRePass" runat="server" Width="184px" TextMode="Password"></asp:TextBox>--%>

                    <asp:TextBox ID="txtNSX" runat="server" Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reRePass" runat="server" ControlToValidate="txtNSX"
                        ErrorMessage="Năm sx không được để trống" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                    <%-- <asp:CompareValidator ID="comRePass" runat="server" ForeColor="Red" ErrorMessage="Nhập lại mật khẩu chưa khớp"
                        ControlToCompare="txtPass" ControlToValidate="txtRePass" ValidationGroup="checkGroup" Display="None"></asp:CompareValidator>--%>
                </p>
                <p>
                    Trọng lượng:&nbsp;&nbsp;&nbsp;&nbsp; <%--<asp:TextBox ID="txtRePass" runat="server" Width="184px" TextMode="Password"></asp:TextBox>--%>

                    <asp:TextBox ID="txtTL" runat="server"  Width="182px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rTL" runat="server" ControlToValidate="txtTL"
                        ErrorMessage="Bạn chưa nhập lại mật khẩu" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" Hàng dễ vỡ" />
                    <%--              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTL"
                        ErrorMessage="Bạn chưa nhập lại mật khẩu" ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>--%>
                </p>
                <p>
                    <asp:Label ID="lblErrorPass" runat="server" ForeColor="Red"></asp:Label>
                </p>
                <asp:ValidationSummary ID="sumResgister" runat="server" ValidationGroup="checkGroup" HeaderText="" ForeColor="Red" Width="450px" />
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button ID="btnAdd" runat="server" Text="Thêm" Width="89px" ValidationGroup="checkGroup" OnClick="btnAdd_Click"  />
                    &nbsp;
               <asp:Button ID="btnCancel" runat="server" Text="Bỏ qua" Width="89px" OnClick="btnCancel_Click"  />
                    &nbsp;
                    &nbsp;
                    </p>
                 
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_SanphamID" DataSourceID="SqlDataSource11" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                         <Columns>
                             <asp:BoundField DataField="PK_SanphamID" HeaderText="PK_SanphamID" ReadOnly="True" SortExpression="PK_SanphamID" />
                             <asp:BoundField DataField="TenSanPham" HeaderText="TenSanPham" SortExpression="TenSanPham" />
                             <asp:BoundField DataField="NamSanXuat" HeaderText="NamSanXuat" SortExpression="NamSanXuat" />
                             <asp:BoundField DataField="Trongluong" HeaderText="Trongluong" SortExpression="Trongluong" />
                             <asp:CheckBoxField DataField="Devo" HeaderText="Devo" SortExpression="Devo" />
                             <asp:CommandField ButtonType="Button" SelectText="Chọn" ShowSelectButton="True" DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" ShowEditButton="True" />
                         </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:db_test01ConnectionString %>" InsertCommand="INSERT INTO tblSanpham(PK_SanphamID, TenSanPham, NamSanXuat, Trongluong, Devo) VALUES (@PK_SanphamID, @TenSanPham, @NamSanXuat, @Trongluong, @Devo)" SelectCommand="SELECT [TenSanPham], [PK_SanphamID], [NamSanXuat], [Trongluong], [Devo] FROM [tblSanpham]" DeleteCommand="DELETE FROM tblSanpham WHERE (PK_SanphamID = @pk_sanphamID)" UpdateCommand="UPDATE tblSanpham SET TenSanPham = @TenSanPham, NamSanXuat = @NamSanXuat, Trongluong = @Trongluong WHERE pk_sanphamID = @pk_sanphamID ">
                         <DeleteParameters>
                             <asp:ControlParameter ControlID="txtID" Name="pk_sanphamID" PropertyName="Text" />
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:ControlParameter ControlID="txtID" Name="PK_SanphamID" PropertyName="Text" />
                             <asp:ControlParameter ControlID="txtName" Name="TenSanPham" PropertyName="Text" />
                             <asp:ControlParameter ControlID="txtNSX" Name="NamSanXuat" PropertyName="Text" />
                             <asp:ControlParameter ControlID="txtTL" Name="Trongluong" PropertyName="Text" />
                             <asp:ControlParameter ControlID="CheckBox1" Name="Devo" PropertyName="Checked" />
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:ControlParameter ControlID="txtName" Name="TenSanPham" PropertyName="Text" />
                             <asp:ControlParameter ControlID="txtNSX" Name="NamSanXuat" PropertyName="Text" />
                             <asp:ControlParameter ControlID="txtTL" Name="Trongluong" PropertyName="Text" />
                             <asp:ControlParameter ControlID="txtID" Name="pk_sanphamID" PropertyName="Text" />
                         </UpdateParameters>
                     </asp:SqlDataSource>
                


            </div>
        </div>
    </form>
</body>
</html>
