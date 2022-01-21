<%-- 
    Document   : yonetici-sayfa
    Created on : 16.Oca.2022, 13:02:40
    Author     : Ertuğrul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="stylesheet/yonetici_giris.css" type="text/css"/>
</head>
<body>
     
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <style>
         
     </style>
</head>

    <div id="baslik_back">
        <img class="logo" src="ercelik.jpg" alt="logo">
        <h1>YÖNETİCİ</h1> 
        
    </div>
        <form action="../index.jsp" method="post">
            <input id="cikis_btn" type="submit" value="ÇIKIŞ YAP" />
        </form>
<div class="orta">
<form action="">
    <button class="musteri" name="musteri" type="submit">müşteri düzenle</button>
    <button class="yonetici" name="yonetici" type="submit">yönetici düzenle</button>
    <button class="urun" name="urun" type="submit">ürün düzenle</button>
</form>
</div>
<%
    String musteri = request.getParameter("musteri");
    String yonetici = request.getParameter("yonetici");
    String urun = request.getParameter("urun");
    
    if (musteri != null) {
            response.sendRedirect("musteriduzenle.jsp");
        }
    if (yonetici != null) {
            response.sendRedirect("yoneticiduzenle.jsp");
        }
    if (urun != null) {
            response.sendRedirect("urunduzenle.jsp");
        }
%>
</body>
</html>
