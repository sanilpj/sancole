<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OverallRanking.aspx.vb" Inherits="Gamification.OverallRanking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Overall Rating</title>
<style type="text/css">
body {
	background-color: #333333;
	background-image: url(images/background-bottom.png);
	margin:0;
	padding:0;
}
td {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 14px;
	color: #FFF;
	padding:4px 10px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="RefreshTime"></asp:Timer>

            <div style="width:100%;height:70px;background: #666 url(images/background-top.png) repeat-y;border-bottom:1px solid #FFF;">
            <div style="float:left;padding-left:25px;padding-top:20px;">
            <img src="images/ttl-overall-ranking.png" width="346" height="30" />
            </div>
            <div style="float:right;padding-right:25px;padding-top:10px;">
            <img src="images/cole-logo.png" width="150" height="50" />
            </div>
            </div>
            <div style="background-color:#333;padding-bottom:25px;">
            <table width="100%" border="0" cellspacing="4" cellpadding="0" style="padding:25px;">
              <tr>
                <td width="20%" valign="bottom"><img src="images/icon-internal.png" width="139" height="50" /></td>
                <td width="20%" valign="bottom"><img src="images/icon-territory.png" width="175" height="50" /></td>
                <td width="15%" align="center" valign="bottom"><img src="images/icon-calls.png" width="98" height="50" /></td>
                <td width="15%" align="center" valign="bottom"><img src="images/icon-meetings.png" width="157" height="50" /></td>
                <td width="15%" align="center" valign="bottom"><img src="images/icon-virtual-meetings.png" width="156" height="50" /></td>
                <td width="15%" align="center" valign="bottom"><img src="images/icon-score.png" width="120" height="31" /></td>
                    <caption>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        </td>
                  </caption>
              </tr>
  
          <asp:Repeater ID="Repeater1" runat="server">
            
            <ItemTemplate>

                

              <tr>
                <td width="20%" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Name")%></td>
                <td width="20%" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Territory")%></td>
                <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "OutboundCall")%></td>
                <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Meetings")%></td>
                <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "VirtualMeetings")%></td>
                <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
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
<p>Data as of March 1, 2013</p>
</div>
</div>


    </form>
</body>
</html>
