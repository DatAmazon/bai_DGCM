<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mvip.aspx.cs" Inherits="DGCM_001.mvip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                Old Pass:&nbsp;
            </p>
            <p>
                &nbsp;<asp:TextBox ID="txtOldPass" runat="server" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rName" runat="server" ControlToValidate="txtOldPass" ErrorMessage="old pass not null"
                    ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reguPass" runat="server" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" Display="None"
                    ControlToValidate="txtOldPass" ErrorMessage="Old Pass must be 8 character contain text and number" ForeColor="Red" ValidationGroup="checkGroup"></asp:RegularExpressionValidator>
            </p>

            <p>
                New Pass:
            </p>
            <p>
                &nbsp;<asp:TextBox ID="txtNewPass" runat="server" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPass" ErrorMessage="new pass not null"
                    ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" Display="None"
                    ControlToValidate="txtNewPass" ErrorMessage="New Pass must be 8 character contain text and number" ForeColor="Red" ValidationGroup="checkGroup"></asp:RegularExpressionValidator>
            </p>

            <p>
                Confirm new pass:

            </p>
            <p>
                <asp:TextBox ID="cfnewpass" runat="server" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cfnewpass" ErrorMessage="User pass not null"
                    ForeColor="Red" Display="None" ValidationGroup="checkGroup"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="comRePass" runat="server" ForeColor="Red" ErrorMessage="Xác thực mật khẩu chưa khớp"
                    ControlToCompare="txtNewPass" ControlToValidate="cfnewpass" ValidationGroup="checkGroup" Display="None"></asp:CompareValidator>
            </p>
            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>

            <asp:ValidationSummary ID="sumResgister" runat="server" ValidationGroup="checkGroup" HeaderText="" ForeColor="Red" Width="450px" />
            <p>
                <asp:Button ID="btnChange" runat="server" Text="Change password" Width="153px" ValidationGroup="checkGroup" OnClick="btnChange_Click" />
            </p>

        </div>
    </form>
</body>
</html>
