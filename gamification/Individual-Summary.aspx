<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Individual-Summary.aspx.vb" Inherits="Gamification.Individual_Summary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Individual Summary</title>
<style type="text/css">
body {
	background-color: #333333;
	background-image: url(images/background-bottom.png);
	margin:0;
	padding:0;
}
table {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 14px;
	color: #FFF;
}
td {
	padding:4px 10px;
}
table.screen {
	font-size: 40px;
	color: #FFF;
}
table.data {
	font-size: 50px;
}
td.reportname 
{
    font-size: 40px;
}
.ind-img {
    border-bottom:7px solid #A45D0E;
    padding-top:20px;
    margin-bottom:15px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">


            <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer2" runat="server" Interval="10000" OnTick="RefreshIndividualTime"></asp:Timer>

<div style="width:100%;height:70px;background: #666 url(images/background-top.png) repeat-y;border-bottom:1px solid #FFF;padding-left:20px;padding-top:10px">
<div style="float:left;padding-left:35px;padding-top:20px;">
<img src="images/ttl-individual-summary.png" width="414" height="30" />
</div>
<div style="float:right;padding-right:70px;padding-top:10px;">
<img src="images/cole-logo.png" width="150" height="50" />
</div>
</div>
<div style="background-color:#333;padding-bottom:25px;padding-left:25px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">


  <tr>


    <td width="30%" align="left" valign="middle" style="padding:10px;" >
        <div>
            <table border="0" cellpadding="0" cellspacing="0" class="screen" 
                width="100%">
                <tr style="padding-left:30px;">
                    <td align="left" 
                        style="font-family:Georgia, 'Times New Roman', Times, serif;font-size:50px;font-weight:bold;border-bottom:1px solid #FFF;" 
                        valign="bottom">
                        <strong>RANK:
                        <span style="font-family:Georgia, 'Times New Roman', Times, serif;font-size:80px;font-weight:bold;"><asp:Label ID="todaysrank" runat="server"></asp:Label></span>
                        </strong>
                    </td>
                </tr>
                <tr><td align="center">
                    <asp:Image BorderWidth="0px" class="ind-img" CssClass="ind-img" ID="indImage"  runat="server" Width="490" Height="634" />
                    </td>
                </tr>
                <tr><td align="center">
                  <span  style="font-family:Georgia, 'Times New Roman', Times, serif;font-size:50px;font-weight:bold;margin-top:15px;" ><asp:Label runat="server" ID="indName"></asp:Label></span></td>
               </tr>
            </table>
        </div>
<!--    <img style="border-bottom:7px solid #A45D0E;padding-top:20px;margin-bottom:15px;"  src= width="170" height="220" /> -->

    <td width="70%" align="center">
    
        <table border="0" cellpadding="0" cellspacing="4" class="data" 
            style="padding:40px 45px 25px 25px;" width="100%">
            <tr>
                <td valign="bottom" width="40%">
                    &nbsp;</td>
                <td align="center" valign="bottom" width="15%">
                    <img src="images/icon-calls.png" width="98" height="50" />
                </td>
                <td align="center" valign="bottom" width="15%">
                    <img src="images/icon-meetings.png" width="157" height="50" />
                </td>
                <td align="center" valign="bottom" width="15%">
                    <img src="images/icon-virtual-meetings.png" width="156" height="50" />
                </td>
                <td align="center" valign="bottom" width="15%">
                    <img src="images/icon-score.png" width="120" height="31" />
                </td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <AlternatingItemTemplate>
                    <tr>
                        <td width="55%" class="reportname">
                            <%# DataBinder.Eval(Container.DataItem, "ReportName")%>
                        </td>
                        <td align="center" width="15%">
                            <%# DataBinder.Eval(Container.DataItem, "OutboundCall")%>
                        </td>
                        <td align="center" width="10%">
                            <%# DataBinder.Eval(Container.DataItem, "Meetings")%></font>
                        </td>
                        <td align="center" width="10%">
                            <%# DataBinder.Eval(Container.DataItem, "VirtualMeetings")%>
                        </td>
                        <td align="center" width="10%">
                            <%# DataBinder.Eval(Container.DataItem, "Score")%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <ItemTemplate>
                    <tr>
                        <td bgcolor="#444444" width="55%" class="reportname">
                            <%# DataBinder.Eval(Container.DataItem, "ReportName")%>
                        </td>
                        <td align="center" bgcolor="#444444" width="15%">
                            <%# DataBinder.Eval(Container.DataItem, "OutboundCall")%>
                        </td>
                        <td align="center" bgcolor="#444444" width="10%">
                            <%# DataBinder.Eval(Container.DataItem, "Meetings")%>
                        </td>
                        <td align="center" bgcolor="#444444" width="10%">
                            <%# DataBinder.Eval(Container.DataItem, "VirtualMeetings")%>
                        </td>
                        <td align="center" bgcolor="#444444" width="10%">
                            <%# DataBinder.Eval(Container.DataItem, "Score")%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
      </td>
  </tr>
</table>
</div>

                
        </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
