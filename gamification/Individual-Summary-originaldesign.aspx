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
	font-size: 17px;
	color: #FFF;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
<div style="width:100%;height:70px;background: #666 url(images/background-top.png) repeat-y;;border-bottom:1px solid #FFF;">
<div style="float:left;padding-left:25px;padding-top:20px;">
<img src="images/ttl-individual-summary.png" width="414" height="30" />
</div>
<div style="float:right;padding-right:25px;padding-top:10px;">
<img src="images/cole-logo.png" width="150" height="50" />
</div>
</div>
<div style="background-color:#333;padding-bottom:25px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">


  <tr>


    <td width="20%" align="center" valign="middle"><img style="border-bottom:7px solid #A45D0E;padding-top:20px;margin-bottom:15px;" src="<%= individualImage %>" width="125" height="175" /><br />
      <span style="font-family:Georgia, 'Times New Roman', Times, serif;font-size:18px;font-weight:bold;margin-top:15px;"><asp:Label runat="server" ID="indName"></asp:Label></span></td>



    <td width="80%" align="center">
    
    <div style="margin:20px 20px 20px 3px;padding:10px;">
    
      <table class="screen" width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:20px;">
      <tr>
        <td width="15%" align="left" valign="bottom" style="border-bottom:1px solid #FFF;"><strong>Sales</strong> (in Thousands)</td>
        <td width="15%" align="center" valign="bottom" style="border-bottom:1px solid #FFF;"><strong>Last Month</strong></td>
        <td width="15%" align="center" valign="bottom" style="border-bottom:1px solid #FFF;"><strong>MTD</strong></td>
        </tr>
      <tr>
        <td width="15%" align="left">Total Sales</td>
        <td width="15%" align="center"></td>
        <td width="15%" align="center"></td>
        </tr>
      <tr>
        <td width="15%" align="left">INAV</td>
        <td width="15%" align="center"></td>
        <td width="15%" align="center"></td>
      </tr>
      </table>
      <br />
      <table class="screen" width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:20px;">
        <tr>
          <td width="15%" align="left" valign="bottom" style="border-bottom:1px solid #FFF;"><strong>Rank</strong></td>
          </tr>
        <tr>
          <td width="15%" align="left">Today's Ranking: #<asp:Label runat="server" ID="todaysrank"></asp:Label></td>
          </tr>
        <tr>
          <td width="15%" align="left">Previous Ranking: #</td>
          </tr>
  </table>
    </div>
      </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="4" cellpadding="0" style="padding:0 25px 25px 25px;">
  <tr>
    <td width="20%" valign="bottom">&nbsp;</td>
    <td width="20%" align="center" valign="bottom"><img src="images/icon-calls.png" width="98" height="50" /></td>
    <td width="20%" align="center" valign="bottom"><img src="images/icon-meetings.png" width="157" height="50" /></td>
    <td width="20%" align="center" valign="bottom"><img src="images/icon-virtual-meetings.png" width="156" height="50" /></td>
    <td width="20%" align="center" valign="bottom"><img src="images/icon-score.png" width="120" height="31" /></td>
  </tr>

          <asp:Repeater ID="Repeater1" runat="server">
            
            <AlternatingItemTemplate>

              <tr>
                <td width="20%"><%# DataBinder.Eval(Container.DataItem, "ReportName")%></td>
                <td width="20%" align="center"><%# DataBinder.Eval(Container.DataItem, "OutboundCall")%></td>
                <td width="20%" align="center"><%# DataBinder.Eval(Container.DataItem, "Meetings")%></td>
                <td width="20%" align="center"><%# DataBinder.Eval(Container.DataItem, "VirtualMeetings")%></td>
                <td width="20%" align="center"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
              </tr>

            </AlternatingItemTemplate>
            <ItemTemplate>
              <tr>
                <td width="20%" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "ReportName")%></td>
                <td width="20%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "OutboundCall")%></td>
                <td width="20%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Meetings")%></td>
                <td width="20%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "VirtualMeetings")%></td>
                <td width="20%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
              </tr>            
            </ItemTemplate>
        </asp:Repeater>


</table>
</div>
<div style="width:100%;height:50px;border-top:1px solid #FFF;font-family: Tahoma, Geneva, sans-serif;font-size:16px;color:#FFF;">
<div style="float:left;margin-left:30px;">
<p>Footer text...</p>
</div>
<div style="float:right;margin-right:30px;">
<p>Data as of March 1, 2013</p>
</div>
</div>

    </form>
</body>
</html>
