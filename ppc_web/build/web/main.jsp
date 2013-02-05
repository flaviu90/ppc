<%-- 
    Document   : index
    Created on : Feb 4, 2013, 3:45:46 AM
    Author     : V
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="ppc.Graf, ppc.Statie" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <style type="text/css">
            html { height: 100% }
            body { height: 100%; margin: 0; padding: 0 }
            #map_canvas { height: 100% }
        </style>
        <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3R8tbzYSZ2Y1Mr0TFHwLKcbRLsTNEzio&sensor=false">
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

    </head>
    <body onload="initialize()">
        <h1>Hello World!</h1>

        <div id="map_canvas" style="width:100%; height:100%"></div>

    </body>
</html>
