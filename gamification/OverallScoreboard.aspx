﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OverallScoreboard.aspx.vb" Inherits="Gamification.OverallScoreboard" %>

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
    height:50px;

}
</style>

<script src="js/jquery-1.4.3.js"  type="text/javascript"></script>

<script src="js/animator.js" type="text/javascript"></script>

<script src="js/rankingTableUpdate.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function () {

        //        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginAsyncRequest);
        //        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(PageLoaded);
        //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endAsyncRequest);

        //var oldtable = $('#rankings .scoreboard');
        //var newtable = $('#rankings2 .scoreboard');
        //alert("start");
        //alert("table class is " + oldtable);

        //        newtable.hide();
        //        oldtable.rankingTableUpdate(newtable);

        $.ajax({
            type: "POST",
            url: "OverallScoreboard.aspx/GetRankings",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                alert("success");
//                alert(data.d);

                var json = data.d;
                console.log('length: ' + json.length);
                //                if (json.hasOwnProperty("d"))
                //                    json = JSON.parse(json.d);

                console.log("0 is " + json);
                console.log("1 is " + jQuery.parseJSON(json)[0]["Rank"]);
                console.log("length is " + jQuery.parseJSON(json).length);
                for (var i = 0; i < jQuery.parseJSON(json).length; i++) {
                    if (jQuery.parseJSON(json)[i] != null && jQuery.parseJSON(json)[i] != "null") {
                        var entry = jQuery.parseJSON(json)[i];
                        console.log("Rank " + jQuery.parseJSON(json)[i]["Rank"] + " Name " + jQuery.parseJSON(json)[i]["Name"] + " Score is " + jQuery.parseJSON(json)[i]["Score"]);
                        $('#rankings2 .scoreboard > tbody:last').append('<tr class="double"><td width="5%" align="center" bgcolor="#444444">' + entry["Rank"]
                            + '</td><td width="25%" bgcolor="#444444">' + entry["Name"]
                            + '</td><td width="25%" bgcolor="#444444">' + entry["Territory"]
                            + '</td><td width="10%" align="center" bgcolor="#444444">' + entry["OutboundCall"]
                            + '</td><td width="10%" align="center" bgcolor="#444444">' + entry["Meetings"]
                            + '</td><td width="10%" align="center" bgcolor="#444444">' + entry["VirtualMeeting"]
                            + '</td><td width="15%" align="center" bgcolor="#444444">' + entry["Score"] + '</td></tr>');
                    }
                }
            }

        })

        var oldtable = $('#rankings .scoreboard');
        var newtable = $('#rankings2 .scoreboard');
        alert("start the anime");
        //alert("table class is " + oldtable);

        newtable.hide();
        oldtable.rankingTableUpdate(newtable);
    });


    var existingTable = null;
    var newTable = null;

    function beginAsyncRequest(sender, args) {
        debugger;
        console.log("came in prior to the timer refresh for " + args.get_postBackElement().id);
        existingTable = $('#rankings .scoreboard').clone();
        if (existingTable != null && $(existingTable).children().children().length > 2) {
            console.log("existingTable data " + $(existingTable).children()[1].children[1].children[0].innerHTML);
            $(existingTable).wrap('<div id="rankings" style="background-color:#333;padding-bottom:25px;padding-right:45px;padding-left:45px;"/>');
        } else {
            console.log("not enough for existingtable ");
        }
//        $().css({ "position": "relative", "top": "-75px" });
    }

    function endAsyncRequest(sender, args) {
        console.log("came in after the timer refresh");
        // after refresh, hopefully there is different data
        newTable = $('#rankings .scoreboard');
        if (existingTable != null) {
            console.log("existing table exists");
            //existingTable.rankingTableUpdate(newTable);
        }
    }

    function PageLoaded(sender, args) {
//        console.log("args.get_postBackElement(); is " + args.get_postBackElement().id);
        var panelsCreated = args.get_panelsCreated();
        for (var i = 0; i < panelsCreated.length; i++) {
            console.log("Panels Updating: " + panelsCreated[i].id);
        }

        var panelsUpdated = args.get_panelsUpdated();
        for (var i = 0; i < panelsUpdated.length; i++) {
            console.log("Panels Updating: " + panelsUpdated[i].id);
        }

        // after refresh, hopefully there is different data
        newTable = $('#rankings .scoreboard');
        if (existingTable != null) {
            console.log("newTable data " + $(newTable).children()[1].children[1].children[0].innerHTML);
            //console.log("existing table exists");
            //console.log("existing table data " + $('#rankings .scoreboard >tbody >tr').length);
            //console.log("existing table data " + $(existingTable).children().children().length);
            if ($(existingTable).children().children().length > 2) {
                existingTable.rankingTableUpdate(newTable);
            }
        }
    }

</script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<!--            
            <asp:Timer ID="Timer1" runat="server" Interval="50000" OnTick="RefreshTime"></asp:Timer> 

            <div style="width:100%;height:70px;background: #666 url(images/background-top.png) repeat-y;border-bottom:1px solid #FFF;padding-left:25px;padding-top:50px;padding-right:45px;">
                <div style="float:left;padding-top:20px;padding-right:45px;padding-left:50px;">
                   <img src="images/ttl-overall-ranking.png" width="346" height="30" />
                </div>
                <div style="float:right;padding-top:10px;padding-right:100px">
                    <img src="images/cole-logo.png" width="150" height="50" align="left"/>
                </div>
            </div>
-->
        <div id="rankings" style="background-color:#333;padding-right:45px;padding-left:45px;">

             <table class="scoreboard" width="100%" border="0" cellspacing="4" cellpadding="0" style="padding:25px;">
             <thead>
              <tr class="double">
                <th class="anim:position" width="5%" valign="bottom">&nbsp;</th>
                <th class="anim:id" width="25%" valign="bottom"><img src="images/smallicon-internal.png"  /></th>
                <th class="anim:constant" width="25%" valign="bottom"><img src="images/smallicon-territory.png"  /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-calls.png" /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-meeting.png" /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-virtual-meetings.png"  /></th>
                <th class="anim:update" width="15%" align="center" valign="bottom"><img src="images/smallicon-score.png" /></th>
              </tr>
            </thead>
  
            <tbody>

          <asp:Repeater ID="Repeater1" runat="server">
            
            <ItemTemplate>

                

              <tr>
                <td width="5%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Rank")%></td>
                <td width="25%" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Name")%></td>
                <td width="25%" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Territory")%></td>
                <td width="10%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "OutboundCall")%></td>
                <td width="10%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Meetings")%></td>
                <td width="10%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "VirtualMeetings")%></td>
                <td width="15%" align="center" bgcolor="#444444"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
              </tr>

            </ItemTemplate>
        </asp:Repeater>


<!--
              <tr>
                <td width="5%" align="center" bgcolor="#444444">1</td>
                <td width="25%" bgcolor="#444444">Kevin Williams</td>
                <td width="25%" bgcolor="#444444">Northern CA</td>
                <td width="10%" align="center" bgcolor="#444444">3</td>
                <td width="10%" align="center" bgcolor="#444444">1</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="15%" align="center" bgcolor="#444444">10</td>
              </tr>

              <tr>
                <td width="5%" align="center" bgcolor="#444444">2</td>
                <td width="25%" bgcolor="#444444">Michele Wiens</td>
                <td width="25%" bgcolor="#444444">Midwest</td>
                <td width="10%" align="center" bgcolor="#444444">1</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="15%" align="center" bgcolor="#444444">8</td>
              </tr>
              <tr>
                <td width="5%" align="center" bgcolor="#444444">3</td>
                <td width="25%" bgcolor="#444444">Bryan Bluth</td>
                <td width="25%" bgcolor="#444444">Ohio Valley</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="15%" align="center" bgcolor="#444444">3</td>
              </tr>
              <tr>
                <td width="5%" align="center" bgcolor="#444444">4</td>
                <td width="25%" bgcolor="#444444">David Grauert</td>
                <td width="25%" bgcolor="#444444">New England</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="15%" align="center" bgcolor="#444444">0</td>
              </tr>
-->
            </tbody>
            </table>
           </div>

        <div id="rankings2" style="background-color:#333;padding-right:45px;padding-left:45px;">

             <table id="tbl2" class="scoreboard" width="100%" border="0" cellspacing="4" cellpadding="0" style="padding:25px;">
             <thead>
              <tr class="double">
                <th class="anim:position" width="5%" valign="bottom">&nbsp;</th>
                <th class="anim:id" width="25%" valign="bottom"><img src="images/smallicon-internal.png"  /></th>
                <th class="anim:constant" width="25%" valign="bottom"><img src="images/smallicon-territory.png"  /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-calls.png" /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-meeting.png" /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-virtual-meetings.png"  /></th>
                <th class="anim:update" width="15%" align="center" valign="bottom"><img src="images/smallicon-score.png" /></th>
              </tr>
            </thead>
  
            <tbody>
            </tbody>
            </table>
         </div>                
<!--
        <div id="rankings2" style="background-color:#333;padding-bottom:25px;padding-right:45px;padding-left:45px;">

             <table class="scoreboard" width="100%" border="0" cellspacing="4" cellpadding="0" style="padding:25px;">
             <thead>
              <tr>
                <th class="anim:position" width="5%" valign="bottom">&nbsp;</th>
                <th class="anim:id" width="25%" valign="bottom"><img src="images/smallicon-internal.png"  /></th>
                <th class="anim:constant" width="25%" valign="bottom"><img src="images/smallicon-territory.png" /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-calls.png"  /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-meeting.png" /></th>
                <th class="anim:update" width="10%" align="center" valign="bottom"><img src="images/smallicon-virtual-meetings.png" /></th>
                <th class="anim:update" width="15%" align="center" valign="bottom"><img src="images/smallicon-score.png"  /></th>
              </tr>
            </thead>
  
            <tbody>
              <tr>
                <td width="5%" align="center" bgcolor="#444444">1</td>
                <td width="25%" bgcolor="#444444">Michele Wiens</td>
                <td width="25%" bgcolor="#444444">Midwest</td>
                <td width="10%" align="center" bgcolor="#444444">1</td>
                <td width="10%" align="center" bgcolor="#444444">2</td>
                <td width="10%" align="center" bgcolor="#444444">2</td>
                <td width="15%" align="center" bgcolor="#444444">9</td>
              </tr>
              <tr>
                <td width="5%" align="center" bgcolor="#444444">2</td>
                <td width="25%" bgcolor="#444444">Kevin Williams</td>
                <td width="25%" bgcolor="#444444">Northern CA</td>
                <td width="10%" align="center" bgcolor="#444444">3</td>
                <td width="10%" align="center" bgcolor="#444444">1</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="15%" align="center" bgcolor="#444444">8</td>
              </tr>
              <tr>
                <td width="5%" align="center" bgcolor="#444444">3</td>
                <td width="25%" bgcolor="#444444">Bryan Bluth</td>
                <td width="25%" bgcolor="#444444">Ohio Valley</td>
                <td width="10%" align="center" bgcolor="#444444">1</td>
                <td width="10%" align="center" bgcolor="#444444">1</td>
                <td width="10%" align="center" bgcolor="#444444">1</td>
                <td width="15%" align="center" bgcolor="#444444">1</td>
              </tr>
              <tr>
                <td width="5%" align="center" bgcolor="#444444">4</td>
                <td width="25%" bgcolor="#444444">David Grauert</td>
                <td width="25%" bgcolor="#444444">New England</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="10%" align="center" bgcolor="#444444">0</td>
                <td width="15%" align="center" bgcolor="#444444">3</td>
              </tr>
            </tbody>
            </table>
           </div>
-->

        </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>