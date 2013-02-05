<%@page import="ppc.getLinii"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>

<%
    ArrayList<String> linii;
    Iterator it;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>linii2</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
    td img {display: block;}
    select{background-color: lightsalmon;
           font-weight: bold;}
</style>
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
   <td colspan="13" ><img name="menuoriginal_r1_c1" src="images/menu-original_r1_c1.jpg" width="1000" height="90" border="0" id="menuoriginal_r1_c1" alt="" /></td>
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
   <td colspan="9" height="16"><img name="margine_sus.jpg" src="images/margine_sus.jpg" width="877" height="16" border="0" id="menuoriginal_r4_c1" alt="" /></td>
   <td colspan="2"><img name="menuoriginal_r4_c12" src="images/menu-original_r4_c12.jpg" width="62" height="16" border="0" id="menuoriginal_r4_c12" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="16" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="5"><img name="menuoriginal_r5_c1" src="images/menu-original_r5_c1.jpg" width="46" height="470" border="0" id="menuoriginal_r5_c1" alt="" /></td>
   <td rowspan="3"><img name="margine_stanga.jpg" src="images/margine_stanga.jpg" width="15" height="415" border="0" id="menuoriginal_r4_c1" alt="" /></td>
   <td colspan="9" rowspan="3" bgcolor="#FF7F42">
   
       
       <table width="630" height="350">
            <tr>
                <td align="center" colspan="2"> 
                        <img src="images/autobuz.png" width="80%" height="80%" />
                        <form name="autobuz" action="" method="POST">  
                        <select  id="alege_linie" name="mydropdown">
                        <option selected="selected" value="">Selectati</option>
                            <%
                                linii = getLinii.getLinii(101,682);
                                it = linii.iterator();
                                while (it.hasNext())
                                {
                                String numeLinie = (String)it.next();
                                out.println("<option value=\"" + numeLinie + "\">" + numeLinie + "</option>");
                                }
                            %>
                        </select> 
                        </form>
                </td>

                <td align="center" colspan="2"> 
                        <img src="images/metrou.png"  width="80%" height="80%"/>
                        <form name="metrou" action="http://www.mydomain.com/myformhandler.cgi" method="POST">
                        <select id="alege_linie" name="mydropdown">
                        <option selected="selected" value="">Selectati</option>                
                        </select>
                        </form>
                </td>


                <td align="center" colspan="2"> 
                        <img src="images/tramvai.png"  width="80%" height="80%"/> 
                        <form name="tramvai" action="http://www.mydomain.com/myformhandler.cgi" method="POST">     
                        <select id="alege_linie" name="mydropdown">
                        <option selected="selected" value="">Selectati</option>
                            <%
                                linii = getLinii.getLinii(1,56);
                                it = linii.iterator();
                                while (it.hasNext())
                                {
                                String numeLinie = (String)it.next();
                                out.println("<option value=\"" + numeLinie + "\">" + numeLinie + "</option>");
                                }
                            %>
                        </select>           
                        </form> 
                </td>
            </tr>

            <tr>
                
                <td align="center" colspan="3"> 
                        <img src="images/troleibuz.png" width="60%" height="60%"/> 
                        <form name="troleibuz" action="http://www.mydomain.com/myformhandler.cgi" method="POST">
                        <select id="alege_linie" name="mydropdown">
                        <option selected="selected" value="">Selectati</option>
                            <%
                                linii = getLinii.getLinii(61,97);
                                it = linii.iterator();
                                while (it.hasNext())
                                {
                                String numeLinie = (String)it.next();
                                out.println("<option value=\"" + numeLinie + "\">" + numeLinie + "</option>");
                                }
                            %>
                        </select>  
                        </form> 
                </td>


                <td align="center" colspan="3"> 
                        <img src="images/autobuz_noapte.png" width="70%" height="70%" /> 
                        <form name="autobuz_noapte" action="http://www.mydomain.com/myformhandler.cgi" method="POST">
                        <select id="alege_linie" name="mydropdown">
                        <option selected="selected" value="">Selectati</option>                
                        </select>
                        </form>
                </td>

            </tr>
            
         </table>
       
   
   </td>
   <td rowspan="3"><img name="margine_dreapta.jpg" src="images/menu-original_r5_c12.jpg" width="18" height="415" border="0" id="menuoriginal_r4_c1" alt="" /></td>
   <td rowspan="5"><img name="menuoriginal_r5_c13" src="images/menu-original_r5_c13.jpg" width="44" height="470" border="0" id="menuoriginal_r5_c13" alt="" /></td>
   <td><img src="images/spacer.gif" width="1" height="161" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img src="images/spacer.gif" width="1" height="27" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img src="images/spacer.gif" width="1" height="227" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="menuoriginal_r8_c2" src="images/menu-original_r8_c2.jpg" width="15" height="55" border="0" id="menuoriginal_r8_c2" alt="" /></td>
   <td colspan="9"><img name="margine_jos" src="images/margine_jos.jpg" width="877" height="19" border="0" id="menuoriginal_r8_c2" alt="" /></td>
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
