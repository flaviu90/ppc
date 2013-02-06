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

function alternativa(raspuns) {
    // Formateaza rezultatul
            var etape = raspuns.split("|");
            var detalii;
            var output = "";
            var traseu = new Array();
            
            for (var i=0; i+1<etape.length; ++i) {
                detalii = etape[i].split(",");
                output += detalii[0] + " " + detalii[3] + "</br>";
                
                if (detalii[1] != 0)
                    traseu.push(new google.maps.LatLng(detalii[1]+0, detalii[2]+0));
            }
            
            // Afisaza detalii traseu
            document.getElementById("ruta").innerHTML += "<p>" + output + "</p>";
    
            // Adauga traseul pe harta
            if (traseuPath2) traseuPath2.setPath(traseu);
            else{
                traseuPath2 = new google.maps.Polyline({
                    path: traseu,
                    strokeColor: "#FF0000",
                    strokeOpacity: 0.5,
                    strokeWeight: 5
                });
            }

            traseuPath2.setMap(map);
}

function deseneaza(raspuns) {
    // Formateaza rezultatul
            var etape = raspuns.split("|");
            var detalii;
            var output = "";
            var traseu = new Array();
            var start = null;
            var end = null;
            var waypts = [];
            var directionsService = new google.maps.DirectionsService();
            var directionsDisplay = new google.maps.DirectionsRenderer();
            directionsDisplay.setMap(map);
            
            for (var i=0; i+1<etape.length; ++i) {
                detalii = etape[i].split(",");
                
                output += detalii[0] + " " + detalii[3] + "</br>";
                
                detalii[1] = parseFloat(detalii[1]);
                detalii[2] = parseFloat(detalii[2]);
                
                if (detalii[1] != 0) {                    
                    traseu.push(new google.maps.LatLng(detalii[1]+0, detalii[2]+0));
                }
                
                if (start == null && detalii[1] != 0) start = new google.maps.LatLng(detalii[1]+0, detalii[2]+0);
                if (detalii[1] != 0) end = new google.maps.LatLng(detalii[1]+0, detalii[2]+0);
                
                if (detalii[1] != 0) waypts.push({
                    location:new google.maps.LatLng(detalii[1]+0, detalii[2]+0),
                    stopover:false
                });
                
                if (i == etape.length-2) output += "Timp estimat: " + parseInt(detalii[4]*7, 10) + " minute</br>";
            }
            
            // Afisaza detalii traseu
            document.getElementById("ruta").innerHTML = "<p>" + output + "</p>";
    
            // Adauga traseul pe harta
            if (traseuPath) traseuPath.setPath(traseu);
            else{
                traseuPath = new google.maps.Polyline({
                    path: traseu,
                    strokeColor: "#FF0000",
                    strokeOpacity: 1.0,
                    strokeWeight: 5
                });
            }

            traseuPath.setMap(map);
            
            var request = {
                origin:start,
                destination:end,
                waypoints:waypts,
                travelMode: google.maps.TravelMode.WALKING
            };
            
            /*
            directionsService.route(request, function(result, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(result);
                }
            });*/
}


function ruta()
{
    var xmlhttp;    
     
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
            deseneaza(raspuns);
        }
    }
    var plecare = document.getElementById("plecare");
    var sosire = document.getElementById("sosire");

    document.getElementById("ruta").innerHTML = "<img src='https://www.caritas.us/sites/default/files/images/misc/loading.gif' height=100 width=100 />";
    xmlhttp.open("GET","ruta?plecare=" + plecare.value + "&sosire=" + sosire.value, true);
    xmlhttp.send();
     
 
 
}