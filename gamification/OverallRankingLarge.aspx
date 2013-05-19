<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OverallRankingLarge.aspx.vb" Inherits="Gamification.OverallRanking" %>

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
tr.double 
{
    height:75px;

}
</style>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7-vsdoc.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="RefreshTime"></asp:Timer>

            <div style="width:100%;height:70px;background: #666 url(images/background-top.png) repeat-y;border-bottom:1px solid #FFF;padding-left:25px;padding-top:50px;padding-right:45px;">
            <div style="float:left;padding-top:20px;padding-right:45px;padding-left:50px;">
            <img src="images/ttl-overall-ranking.png" width="346" height="30" />
            </div>
            <div style="float:right;padding-top:10px;padding-right:100px">
            <img src="images/cole-logo.png" width="150" height="50" align="left"/>
            </div>
            </div>
            <div style="background-color:#333;padding-bottom:25px;padding-right:45px;padding-left:45px;">
            <table width="100%" height="100%" border="0" cellspacing="4" cellpadding="0">
            <!-- Split the table in two columns -->

            <tr>
            
            <td width="50%">
                <table cellspacing="10px" width="100%">
                  <tr>
                    <td width="15%" align="center" valign="bottom"><img src="images/smallicon-score.png" /></td>
                    <td width="40%" valign="bottom"><img src="images/smallicon-internal.png"  /></td>
                    <td width="15%" align="center" valign="bottom"><img src="images/smallicon-calls.png" /></td>
                    <td width="15%" align="center" valign="bottom"><img src="images/smallicon-meeting.png"  /></td>
                    <td width="15%" align="center" valign="bottom"><img src="images/smallicon-virtual-meetings.png" /></td>

                  </tr>
                  <asp:Repeater ID="Repeater1" OnItemDataBound="R1_ItemDataBound" runat="server">
            
                    <ItemTemplate>
                      <tr class="double">
                        <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Rank")%></td>
                        <td width="40%" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Name")%></td>
                        <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "OutboundCall")%></td>
                        <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Meetings")%></td>
                        <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "VirtualMeetings")%></td>
                      </tr>

                    </ItemTemplate>
                    <SeparatorTemplate>
                        <!-- here we seperate > 10 into a new table -->
                        <asp:Literal ID="seperator" runat="server">
                        </asp:Literal>
                    </SeparatorTemplate>
                </asp:Repeater>
            <!--
                </table>
            </td>

            <td width="50%" valign="top">
            <table cellspacing="10px" width="100%" >
            
                  <tr>
                    <td width="15%" align="center" valign="bottom"><img src="images/smallicon-score.png" /></td>
                    <td width="40%" valign="bottom"><img src="images/smallicon-internal.png"  /></td>
                    <td width="15%" align="center" valign="bottom"><img src="images/smallicon-calls.png" /></td>
                    <td width="15%" align="center" valign="bottom"><img src="images/smallicon-meeting.png"  /></td>
                    <td width="15%" align="center" valign="bottom"><img src="images/smallicon-virtual-meetings.png" /></td>

                  </tr>

                      <tr class="double">
                        <td width="15%" align="center" bgcolor="#444444">55</td>
                        <td width="40%" bgcolor="#444444">Devin DeBenedetto</td>
                        <td width="15%" align="center" bgcolor="#444444">25</td>
                        <td width="15%" align="center" bgcolor="#444444">8</td>
                        <td width="15%" align="center" bgcolor="#444444">2</td>
                      </tr>
-->                

            </table>
            </td>

            </tr>


  

                
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
