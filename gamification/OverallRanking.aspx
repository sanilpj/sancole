<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OverallRanking.aspx.vb" Inherits="Gamification.OverallRanking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Overall Rating</title>
<style type="text/css">
body {
	background-color: #333333;
	background-image: url(images/background-bottom.png);
	margin:0;
	padding:10;
}
td {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 25px;
	color: #FFF;
	padding:4px 10px;
}
    .style1
    {
        width: 18%;
    }
    .style2
    {
        width: 22%;
    }
    .style5
    {
        width: 24%;
    }
    .style7
    {
        width: 33%;
    }
    .style8
    {
        width: 48%;
    }
    .style9
    {
        width: 39%;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="RefreshTime"></asp:Timer>

            <div style="width:100%;height:70px;background: #666 url(images/background-top.png) repeat-y;border-bottom:1px solid #FFF;padding-left:25px;padding-top:12px;padding-right:45px;">
            <div style="float:left;padding-top:20px;padding-right:45px;padding-left:50px;">
            <img src="images/ttl-overall-ranking.png" width="346" height="30" />
            </div>
            <div style="float:right;padding-top:10px;padding-right:100px">
            <img src="images/cole-logo.png" width="150" height="50" align="left"/>
            </div>
            </div>
            <div style="background-color:#333;padding-bottom:25px;padding-right:45px;padding-left:45px;">
            <table width="100%" border="0" cellspacing="4" cellpadding="0" style="padding:25px;">
              <tr>
                <td valign="bottom" class="style9"><img src="images/Scoreboard-Icon-Internal.png"  /></td>
                <td valign="bottom" class="style8"><img src="images/Scoreboard-Icon-Territory.png"  /></td>
                <td align="center" valign="bottom" class="style5"><img src="images/Scoreboard-Icon-Calls.png" /></td>
                <td align="center" valign="bottom" class="style2"><img src="images/Scoreboard-Icon-Meetings.png" /></td>
                <td align="center" valign="bottom" class="style1"><img src="images/Scoreboard-Icon-Virtual-meetings.png" /></td>
                <td width="20%" align="center" valign="bottom"><img src="images/Scoreboard-Icon-Score.png" /></td>
                <!-- <td width="15%" align="center" valign="bottom">
                    &nbsp;&nbsp;<img src="images/Scoreboard-Icon-Percent-small.png" /></td> -->
              </tr>
  
          <asp:Repeater ID="Repeater1" runat="server">
            
            <ItemTemplate>

                

              <tr>
                <td valign="bottom" class="style9" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Name")%></td>
                <td class="style8" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Territory")%></td>
                <td class="style5" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "OutboundCall")%></td>
                <td class="style2" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Meetings")%></td>
                <td class="style1" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "VirtualMeetings")%></td>
                <td width="20%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
                <!-- <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "CockpitPercentage")%></td> -->
              </tr>

            </ItemTemplate>
        </asp:Repeater>

                
        </ContentTemplate>
        </asp:UpdatePanel>




</table>
</div>
<div style="width:100%;height:50px;border-top:1px solid #FFF;font-family: Tahoma, Geneva, sans-serif;font-size:16px;color:#FFF;">
<div style="float:left;margin-left:30px;">

</div>
<div style="float:right;margin-right:30px;">

</div>
</div>


    </form>
</body>
</html>
