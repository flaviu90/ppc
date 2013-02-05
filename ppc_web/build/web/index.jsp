<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="ppc.Graf, ppc.Statie" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>menu-original</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">td img {display: block;}</style>


    <style type="text/css">
     
td img {display: block;}


input[type="text"]
{
width:150px;
display:block;
margin-bottom:10px;
background-color:lightsalmon;
font-weight: bold;


}
input[type="button"]
{
width:80px;
margin-left:0px;
display:block;
background-color:lightsalmon;
font-family:"Myriad Pro";
font-weight:bold;
font-size:16px;
}


.suggest{
 	position:absolute;
        background-color: lightsalmon;
        font-weight: bold;
        z-index: 100;
        
 	
 	}
 
 .suggest div{
 	
 	background-color: lightsalmon;
        font-weight: bold;
 	padding-left:4px;
        padding-right: 4px;
 	cursor:hand;
 	text-align:left;
        z-index: 100;
 	}
 
 .suggest div.over{
 	background-color: orangered;
        font-weight: bold;
        z-index: 100;
 	}

    </style>
    
    <script type="text/javascript" src="detalii_statii.js"></script> 
    <script type="text/javascript" src="autcomplete.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA3R8tbzYSZ2Y1Mr0TFHwLKcbRLsTNEzio&sensor=false">
    </script>
    <script type="text/javascript">
            function initialize() {
                var myLatlng = new google.maps.LatLng(44.443585,26.097279);
                var mapOptions = {
                    zoom: 12,
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
                
                google.maps.event.addListener(map, "zoom_changed", function() {
                    if (map.getZoom() > 14) map.setZoom(14);
                });

            <%
                Graf G = new Graf();
                G.adaugaStatii();

                out.println(" lat=[");
                DecimalFormat formatter = new DecimalFormat("##.000000000");
                for (Statie s : G.tabelStatii.values()) {
                    out.println(formatter.format(s.latitudine) + ",");
                }
                out.println(" ];");
                out.println(" lon=[");
                for (Statie s : G.tabelStatii.values()) {
                    out.println(formatter.format(s.longitudine) + ",");
                }
                out.println(" ];");
                out.println(" desc=[");
                for (Statie s : G.tabelStatii.values()) {
                    out.println("\"" + s.nume + "\",");
                }
                out.println(" ];");
            %>
                    for (var i = 0; i < lat.length; i++)
                        if (lat[i] != 0.0)
                    {
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(lat[i],lon[i]),
                            map: map,
                            title: desc[i]
                        });
                    }
                }
        </script>

<!--Fireworks CS5 Dreamweaver CS5 target.  Created Sun May 20 00:07:22 GMT+0300 (GTB Daylight Time) 2012-->
</head>
<body bgcolor="#595d67" onload="initialize();createAutoComplete();">
<center>
<table style="display: inline-table;" border="0" cellpadding="0" cellspacing="0" width="1000">
<!-- fwtable fwsrc="menu-original.png" fwpage="Page 1" fwbase="menu-original.jpg" fwstyle="Dreamweaver" fwdocid = "1034339523" fwnested="0" -->
  <tr>
   <td><img src="images/spacer.gif" width="46" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="15" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="53" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="78" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="70" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="8" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="27" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="51" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="90" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="90" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="410" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="18" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="44" height="1" border="0" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="13"><img name="menuoriginal_r1_c1" src="images/menu-original_r1_c1.jpg" width="1000" height="90" border="0" id="menuoriginal_r1_c1" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="90" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2" colspan="3"><img name="menuoriginal_r2_c1" src="images/menu-original_r2_c1.jpg" width="114" height="74" border="0" id="menuoriginal_r2_c1" alt="" /></td>
   
   <td> <a href="index.jsp"><img  id="meniu" name="menuoriginal_r2_c4" src="images/menu-original_r2_c4.jpg" width="78" height="30" border="0" id="menuoriginal_r2_c4" alt="" /> </a> </td>
   <td id="meniu" colspan="2"> <a href="linii.jsp"><img name="menuoriginal_r2_c5" src="images/menu-original_r2_c5.jpg" width="78" height="30" border="0" id="menuoriginal_r2_c5" alt="" /> </a> </td>
   <td id="meniu" colspan="2"> <a href="statii.jsp"> <img name="menuoriginal_r2_c7" src="images/menu-original_r2_c7.jpg" width="78" height="30" border="0" id="menuoriginal_r2_c7" alt="" /> </a> </td>
   <td id="meniu"><img name="menuoriginal_r2_c9" src="images/menu-original_r2_c9.jpg" width="90" height="30" border="0" id="menuoriginal_r2_c9" alt="" /></td>
   <td id="meniu"><img name="menuoriginal_r2_c10" src="images/menu-original_r2_c10.jpg" width="90" height="30" border="0" id="menuoriginal_r2_c10" alt="" /></td>
   
   <td rowspan="2" colspan="3"><img name="menuoriginal_r2_c11" src="images/menu-original_r2_c11.jpg" width="472" height="74" border="0" id="menuoriginal_r2_c11" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="30" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="7"><img name="menuoriginal_r3_c4" src="images/menu-original_r3_c4.jpg" width="414" height="44" border="0" id="menuoriginal_r3_c4" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="44" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="2"><img name="menuoriginal_r4_c1" src="images/menu-original_r4_c1.jpg" width="61" height="16" border="0" id="menuoriginal_r4_c1" alt="" /></td>
   <td colspan="9"><img name="menuoriginal_r4_c3" src="images/menu-original_r4_c3.jpg" width="877" height="16" border="0" id="menuoriginal_r4_c3" alt="" /></td>
   <td colspan="2"><img name="menuoriginal_r4_c12" src="images/menu-original_r4_c12.jpg" width="62" height="16" border="0" id="menuoriginal_r4_c12" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="16" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="5"><img name="menuoriginal_r5_c1" src="images/menu-original_r5_c1.jpg" width="46" height="470" border="0" id="menuoriginal_r5_c1" alt="" /></td>
   <td rowspan="3"><img name="menuoriginal_r5_c2" src="images/menu-original_r5_c2.jpg" width="15" height="415" border="0" id="menuoriginal_r5_c2" alt="" /></td>
   <td colspan="3" background="images/menu-original_r5_c3.jpg">
       
    <center>
        
    <form name="input" action="" method="get" >
        <b>Statie de plecare:</b>
        <input type="text" name="plecare" id="plecare" onkeyup="showData(this.value);" size="20"/>
        <div  id="suggestplecare" class="suggest" style="visibility:hidden;border:#000000 1px solid;"></div>
        
        <b>Statie de sosire:</b>
        <input type="text" name="sosire" id="sosire" onkeyup="showData(this.value)" size="20"/>
        <div id="suggestsosire" class="suggest" style="visibility:hidden;border:#000000 1px solid;"></div>
        

    <input type="button" value="Ruta" onClick="ruta()"/> 
    </form>
      
    </center>
   
   </td>
   <td rowspan="3" colspan="2">
       <img name="menuoriginal_r5_c6" src="images/menu-original_r5_c6.jpg" width="35" height="415" border="0" id="menuoriginal_r5_c6" alt="" />
   </td>
   <td rowspan="3" colspan="4">
   <center>
    <div id="map_canvas" style="width:641px; height:415px;" ></div>
    </center>

   
   </td>
   <td rowspan="3"><img name="menuoriginal_r5_c12" src="images/menu-original_r5_c12.jpg" width="18" height="415" border="0" id="menuoriginal_r5_c12" alt="" /></td>
   <td rowspan="5"><img name="menuoriginal_r5_c13" src="images/menu-original_r5_c13.jpg" width="44" height="470" border="0" id="menuoriginal_r5_c13" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="161" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="3">
       <img name="menuoriginal_r6_c3" src="images/menu-original_r6_c3.jpg" width="201" height="27" border="0" id="menuoriginal_r6_c3" alt="" />
   </td>
   <td><img src="images/spacer.gif" width="1" height="27" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="3">
       <div id="ruta">
           
       </div>
   </td>
   <td><img src="images/spacer.gif" width="1" height="227" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="menuoriginal_r8_c2" src="images/menu-original_r8_c2.jpg" width="15" height="55" border="0" id="menuoriginal_r8_c2" alt="" /></td>
   <td colspan="9"><img name="menuoriginal_r8_c3" src="images/menu-original_r8_c3.jpg" width="877" height="19" border="0" id="menuoriginal_r8_c3" alt="" /></td>
   <td rowspan="2"><img name="menuoriginal_r8_c12" src="images/menu-original_r8_c12.jpg" width="18" height="55" border="0" id="menuoriginal_r8_c12" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="19" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="9"><img name="menuoriginal_r9_c3" src="images/menu-original_r9_c3.jpg" width="877" height="36" border="0" id="menuoriginal_r9_c3" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="36" border="0" alt="" /></td>
  </tr>
</table>
</center>
</body>
</html>
