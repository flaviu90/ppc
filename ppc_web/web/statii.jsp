<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "ppc.getStatii" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>statii</title>
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
background-color:#FFB997;


}
#alege_statie
{
  
   
   height: 20px;
   width : 150px;
}

select{background-color: lightsalmon;
           font-weight: bold;}

#detalii_statii{
    padding-left: 10px;
    padding-right: 10px;
    font-weight: bold;
    text-align: center;
    border:1px solid red;
    background-color: lightsalmon;
}
#numele_statiei
{
    
    font-weight: bold;
    font-style: italic;
    color:cyan;
    text-align: center;
    
}
#afisare_detalii_statie
{
    overflow: auto;
    width : 641px;
    height : 415px; 
}

    </style>
<script type="text/javascript" src="detalii_statii.js"></script>    

<!--Fireworks CS5 Dreamweaver CS5 target.  Created Sun May 20 00:07:22 GMT+0300 (GTB Daylight Time) 2012-->
</head>
<body bgcolor="#595d67">
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
   
   <td> <a href="index.jsp"><img name="menuoriginal_r2_c4" src="images/menu-original_r2_c4.jpg" width="78" height="30" border="0" id="menuoriginal_r2_c4" alt="" /> </a></td>
   <td colspan="2"> <a href="linii.jsp"><img name="menuoriginal_r2_c5" src="images/menu-original_r2_c5.jpg" width="78" height="30" border="0" id="menuoriginal_r2_c5" alt="" /> </a> </td>
   <td colspan="2"> <a href="statii.jsp"><img name="menuoriginal_r2_c7" src="images/menu-original_r2_c7.jpg" width="78" height="30" border="0" id="menuoriginal_r2_c7" alt="" /> </a> </td>
   <td><img name="menuoriginal_r2_c9" src="images/menu-original_r2_c9.jpg" width="90" height="30" border="0" id="menuoriginal_r2_c9" alt="" /></td>
   <td><img name="menuoriginal_r2_c10" src="images/menu-original_r2_c10.jpg" width="90" height="30" border="0" id="menuoriginal_r2_c10" alt="" /></td>
   
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
   
   
<form name="myform" action="http://www.mydomain.com/myformhandler.cgi" method="POST">
<h3>Alegeti statia</h3>
<div align="center">
    <select id="alege_statie" name="mydropdown" onchange="afiseaza_info_statii()">
    <option selected="selected" value="">Selectati</option>
    <%
        ArrayList<String> statii = getStatii.getStatii();
        Iterator it = statii.iterator();
        while (it.hasNext())
        {
         String numeStatie = (String)it.next();
         out.println("<option value=\"" + numeStatie + "\">" + numeStatie + "</option>");
        }
    %>
</select>
</div>
</form>
   
  <!-- 
   <center>
     <form name="input" action="" method="get" >
    <b>Alegeti statia</b><input type="text" name="Name"  size="20"/>
	 <input type="button" value="Cauta"/> 
     </form>
   </center>
   -->
   </td>
   <td rowspan="3" colspan="2"><img name="menuoriginal_r5_c6" src="images/menu-original_r5_c6.jpg" width="35" height="415" border="0" id="menuoriginal_r5_c6" alt="" /></td>
   <td colspan="4" rowspan="3" bgcolor ="#FF7F42"> 
       <div id="afisare_detalii_statie">
           
       </div>
       
       
   </td>
   <td rowspan="3"><img name="menuoriginal_r5_c12" src="images/menu-original_r5_c12.jpg" width="18" height="415" border="0" id="menuoriginal_r5_c12" alt="" /></td>
   <td rowspan="5"><img name="menuoriginal_r5_c13" src="images/menu-original_r5_c13.jpg" width="44" height="470" border="0" id="menuoriginal_r5_c13" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="161" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="3"><img name="menuoriginal_r6_c3" src="images/menu-original_r6_c3.jpg" width="201" height="27" border="0" id="menuoriginal_r6_c3" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="27" border="0" alt="" /></td>
  </tr>
  <tr>
   <td colspan="3"><img name="menuoriginal_r7_c3" src="images/menu-original_r7_c3.jpg" width="201" height="227" border="0" id="menuoriginal_r7_c3" alt="" /></td>
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
