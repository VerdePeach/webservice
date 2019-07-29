<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Contact</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div id="blink">
    <a href="https://www.youtube.com/channel/UCrjCHS2nTf8lPOuCWZBX0ig">Click here to continue!</a>
</div>
</body>
</html>

<script>
    $(document).ready(function() {
        var freqSecs = 1.2;
        setInterval (blink, freqSecs*500 );

        function blink() {
            var inout = (freqSecs*500)/0.5;
            $("#blink").fadeIn(inout).fadeOut(inout);
        }
    });
</script>
<style>
    a {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }
</style>