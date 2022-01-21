<%-- 
    Document   : yoneticiguncelle
    Created on : 19.Oca.2022, 15:51:22
    Author     : Ertuğrul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="data.*"%>
<%@page import="database.DataBase"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="stylesheet/musteriguncelle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div id="baslik_back">
        <img class="logo" src="ercelik.jpg" alt="logo">
        <h1>ERÇELİK-DEPO</h1> 
    </div>
    <div class="yap">
    <form action="">
        <label>ad</label><br>
        <input name="ad" type="text"/><br>
        <label>soyad</label><br>
        <input name="soyad" type="text"/><br>
        <label>telefon</label><br>
        <input name="telefon" type="text"/><br>
        <label>eposta</label><br>
        <input name="eposta" type="text"/><br>
        <label>kullanici adi</label><br>
        <input name="kullaniciadi" type="text"/><br>
        <label>şifre1</label><br>
        <input name="sifre1" type="text"/><br>
        <label>şifre2</label><br>
        <input name="sifre2" type="text"/><br>
        <button type="submit" name="guncelle">güncelle</button>
        <button type="submit" name="iptal">iptal</button>
    </form></div>
    <%
        DataBase dt = new DataBase();
        String ad = request.getParameter("ad");
        String soyad = request.getParameter("soyad");
        String telefon = request.getParameter("telefon");
        String eposta = request.getParameter("eposta");
        String kullaniciadi = request.getParameter("kullaniciadi");
        String sifre1 = request.getParameter("sifre1");
        String sifre2 = request.getParameter("sifre2");
        String guncelle = request.getParameter("guncelle");
        String iptal = request.getParameter("iptal");
        HttpSession oturum = request.getSession();
        String edit;
        if (guncelle != null) {
            edit=oturum.getAttribute("edit").toString();
                if (!ad.equals("")&&!soyad.equals("")&&!telefon.equals("")&&!eposta.equals("")&&!kullaniciadi.equals("")
                        &&!sifre1.equals("")&&!sifre2.equals("")&&edit != null) {//
                    dt.yoneticiGuncelle(Integer.valueOf(edit), ad, soyad, telefon, eposta, kullaniciadi, sifre1, sifre2);
                    response.sendRedirect("yoneticiduzenle.jsp");
                }
            }
        else if(iptal != null){
            response.sendRedirect("yoneticiduzenle.jsp");
        }
    %>
</body>
</html>
