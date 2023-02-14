<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template1.aspx.cs" Inherits="DGCM_001.WebForm1" EnableEventValidation="false" %>


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
                        ErrorMessage="Bạn chưa nhập trọng lượng" ForeColor="Red" Display="None" ValidationGroup="checkGroup" ></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="compare" runat="server" ControlToValidate="txtTL" ValueToCompare="0"
                         Operator="GreaterThan" ValidationGroup="checkGroup" ErrorMessage="Trọng lượng lớn hơn hoặc bằng 0" ForeColor="Red"
                         Display="None" ></asp:CompareValidator>

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
                    <asp:Button ID="btnAdd" runat="server" Text="Thêm" Width="89px" ValidationGroup="checkGroup" OnClick="btnAdd_Click" />
                    &nbsp;
               <asp:Button ID="btnCancel" runat="server" Text="Bỏ qua" Width="89px" OnClick="btnCancel_Click" />
                    &nbsp;
                    <asp:Button ID="btnSua" runat="server" Text="Sửa" Width="89px" OnClick="btnSua_Click" />
                    &nbsp;
                    <asp:Button ID="btnXoa" runat="server" Text="Xóa" Width="89px" OnClick="btnXoa_Click" />
                </p>


            </div>
        </div>
        
        <asp:GridView ID="dgv" runat="server" OnRowDataBound="dgv_RowDataBound"  AutoGenerateColumns="false"  OnSelectedIndexChanged="dgv_SelectedIndexChanged" >
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="IDSP" runat="server" Text='<%# Eval("PK_SanphamID") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="Name" runat="server" Text='<%# Eval("TenSanPham") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NSX">
                    <ItemTemplate>
                        <asp:Label ID="NSX" runat="server" Text='<%# Eval("NamSanXuat") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Trongluong">
                    <ItemTemplate>
                        <asp:Label ID="Trongluong" runat="server" Text='<%# Eval("Trongluong") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Devo">
                    <ItemTemplate>
                        <asp:Checkbox runat="server" ID="dgv_Ck" Checked='<%# Eval("Devo") %>' Enabled="false" />                                            
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>

        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <p>Tên:<asp:Label ID="Name" runat="server" Text='<%#  Eval("TenSanPham") %>' ></asp:Label></p>
                
                <p>NSX:<asp:Label ID="NSX" runat="server" Text='<%# Eval("NamSanXuat") %>' ></asp:Label></p>
                <p>Trongluong:<asp:Label ID="Trongluong" runat="server" Text='<%# Eval("Trongluong") %>' ></asp:Label></p>
                <p>----------------------------------------------</p>
            </ItemTemplate>
        </asp:Repeater>

    </form>
    <script>

    </script>
</body>
</html>
