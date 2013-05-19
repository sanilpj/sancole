<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OutboundCalls.aspx.vb" Inherits="Gamification.OutboundCalls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        
        </ContentTemplate>
        </asp:UpdatePanel>

        
    
    
    </div>
    </form>
</body>
</html>
