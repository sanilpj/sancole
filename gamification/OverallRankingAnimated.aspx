<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OverallRankingAnimated.aspx.vb" Inherits="Gamification.OverallRankingAnimated" %>

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
.alphabets 
{
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 25px;
	color: #FFF;
    
}
.double 
{
    height:75px;

}
</style>
<!--[if lt IE 9]>
  <link rel="stylesheet" href="css/blueprint/ie.css" type="text/css" media="screen, projection">
<![endif]-->
<link rel="stylesheet" href="css/blueprint/screen.css" type="text/css" media="screen, projection">
<link rel="stylesheet" href="css/blueprint/print.css" type="text/css" media="print"> 

<script type="text/javascript" src="js/jquery-1.7.js"></script>
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/jquery-swapsies.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.2.custom.min.js"></script>


<script type="text/javascript">

    $(document).ready(function () {
        alert("starting");
        //alert($(".1").html()); 
        //$("#Devin").fadeOut(3000);
        //$("#Devin").swap({
        //    target: "Brooke",
        //    opacity: "0.5",
        //    speed: 1000,
        //    callback: function () {
        //        alert("Rank Changed");
        //    }
        //});
        //$("#Devin").fadeOut('fast', function () {
        //    $("#Angelique").fadeIn();
        //});
        $("#Devin").fadeOut(5000, function () {

            var divOneText = $('#Devin').html();
            var divTwoText = $('#Angelique').html();

            if (divOneText != '' && divTwoText != '') {
                $('#Devin').html(divTwoText);
                $('#Angelique').html(divOneText);
            }
            $("#Devin").fadeIn();

            $("#Jennifer").animateHighlight();
            //            $("#Brooke").animate({ "color": "yellow" }, "slow");

        });

        $.fn.animateHighlight = function (highlightColor, duration) {
            var highlightBg = highlightColor || "#FFFF9C";
            var animateMs = duration || "slow"; // edit is here
            var originalBg = this.css("background-color");

            if (!originalBg || originalBg == highlightBg)
                originalBg = "#CCFFFFF"; // default to white

            jQuery(this)
            .css("backgroundColor", highlightBg)
            .animate({ backgroundColor: originalBg }, animateMs, null, function () {
                jQuery(this).css("backgroundColor", originalBg);
            });
        };
    });

</script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="500000" OnTick="RefreshTime"></asp:Timer>

            <div style="width:100%;height:70px;background: #666 url(images/background-top.png) repeat-y;border-bottom:1px solid #FFF;padding-left:25px;padding-top:50px;padding-right:45px;">
            <div style="float:left;padding-top:20px;padding-right:45px;padding-left:50px;">
                <img src="images/ttl-overall-ranking.png" width="346" height="30" />
            </div>
            <div style="float:right;padding-top:10px;padding-right:100px">
                <img src="images/cole-logo.png" width="150" height="50" align="left"/>
            </div>
            </div>
        

                <div class="container " style="width:100%;background-color:#333;border-bottom:0px solid #FFF;padding-left:25px;padding-top:50px;padding-right:45px;">
                        <div class="span-2" style="width:60px;"><img src="images/smallicon-score.png" /></div>
                        <div class="span-2" style="width:250px"><img src="images/smallicon-internal.png" /></div>
                        <div class="span-2" style="width:60px;"><img src="images/smallicon-calls.png" /></div>
                        <div class="span-2" style="width:60px;"><img src="images/smallicon-meeting.png"  /></div>
                        <div class="span-2" style="width:60px;"><img src="images/smallicon-virtual-meetings.png" /></div>
                        <div class="span-4">&nbsp;</div>
                        <div class="span-2" style="width:60px;"><img src="images/smallicon-score.png" /></div>
                        <div class="span-2" style="width:250px;"><img src="images/smallicon-internal.png" /></div>
                        <div class="span-2" style="width:60px;"><img src="images/smallicon-calls.png" /></div>
                        <div class="span-2" style="width:60px;"><img src="images/smallicon-meeting.png"  /></div>
                        <div class="span-2 last" style="width:60px;"><img src="images/smallicon-virtual-meetings.png" /></div>
                        <div class="clear">&nbsp;</div>
                        <div id="Devin">
                            <div class="double span-2 alphabets" style=" position:relative; opacity:inherit;filter:inherit;background-color:#444444;height:100px;width:60px"><div style="opacity:inherit;filter:inherit;position:absolute; top:40%; left:40%">1</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; opacity:inherit;filter:inherit;background-color:#444444;height:100px;width:250px"><div style="opacity:inherit;filter:inherit;position:absolute;top:20%">Devin DeBenedetto</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; opacity:inherit;filter:inherit;background-color:#444444;height:100px;width:60px"><div style="opacity:inherit;filter:inherit;position:absolute; top:40%; left:40%">35</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; opacity:inherit;filter:inherit;background-color:#444444;height:100px;width:60px"><div style="opacity:inherit;filter:inherit;position:absolute; top:40%; left:40%">4</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; opacity:inherit;filter:inherit;background-color:#444444;height:100px;width:60px"><div style="opacity:inherit;filter:inherit;position:absolute; top:40%; left:40%">3</div></div>
                        </div>   
                        <div class="span-4">&nbsp;</div>
                        <div id="Jennifer">
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">2</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:250px"><div style="position:absolute; top:20%;">Jennifer Swanton</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">33</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">4</div></div>
                            <div class="double span-2 alphabets last" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">3</div></div>
                        </div>
                        <div class="clear span-24">&nbsp;</div>
                        <div id="Brooke">
                            <div class="double span-2 clear alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">3</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:250px"><div style="position:absolute;top:10%">Brooke Fox</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">30</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">4</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">3</div></div>
                        </div>   
                        <div class="span-4">&nbsp;</div>
                        <div id="Angelique">
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">4</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:250px"><div style="position:absolute; top:20%;">Angelique Misiura</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">25</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">4</div></div>
                            <div class="double span-2 alphabets" style=" position:relative; background-color:#444444;height:100px;width:60px"><div style="position:absolute; top:40%; left:40%">3</div></div>
                        </div>
                        <div class="last">&nbsp;</div>
                        <div class="clear span-24">&nbsp;</div>
                </div>

  

                
        </ContentTemplate>
        </asp:UpdatePanel>




<div style="width:100%;height:50px;border-top:1px solid #FFF;font-family: Tahoma, Geneva, sans-serif;font-size:16px;color:#FFF;">
<div style="float:left;margin-left:30px;">

</div>
<div style="float:right;margin-right:30px;">

</div>
</div>


    </form>
</body>
</html>
