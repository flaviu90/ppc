function afiseaza_info_statii()
{
     var xmlhttp;    
     var detalii;
     
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
        
    //alert(xmlhttp.responseText);
    detalii = xmlhttp.responseText.split(",");
    //alert(aNames);
    document.getElementById("afisare_detalii_statie").innerHTML = detalii;
 }
 }
 var alege = document.getElementById("alege_statie");

xmlhttp.open("GET","detalii_statii?statie=" + alege.options[alege.selectedIndex].value, true);
xmlhttp.send();
     
 
 
 }


function ruta()
{
     var xmlhttp;    
     var detalii;
     
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
        
    var raspuns = xmlhttp.responseText;
    document.getElementById("ruta").innerHTML = raspuns;
 }
 }
 var plecare = document.getElementById("plecare");
 var sosire = document.getElementById("sosire");
 
xmlhttp.open("GET","ruta?plecare=" + plecare.value + "&sosire=" + sosire.value, true);
xmlhttp.send();
     
 
 
 }