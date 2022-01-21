<%-- 
    Document   : urunguncelle
    Created on : 19.Oca.2022, 14:07:45
    Author     : Ertuğrul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.DataBase"%>
<%@page import="data.*"%>
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
        <label>isim</label><br>
        <input type="text" name="isim"/><br>
        <label>fiyat</label><br>
        <input type="text" name="fiyat"/><br>
          <label>stok adeti</label><br>
            <input type="text" name="stok"/><br>
        <button name="guncelle" type="submit">güncelle</button>
    </form>
    <form action="urunduzenle.jsp">
        <button type="submit">vazgeç</button>
    </form></div>
    <%
        DataBase dt = new DataBase();
        String isim =request.getParameter("isim");
        String fiyat =request.getParameter("fiyat");
        String stok = request.getParameter("stok");
        String guncelle = request.getParameter("guncelle");
        HttpSession oturum = request.getSession();
        String edit;
        if (guncelle != null) {
            edit=oturum.getAttribute("edit").toString();
                if (!isim.equals("")&&!fiyat.equals("")&&edit != null) {
                    dt.urunGuncelle(Integer.valueOf(edit), isim, fiyat,stok);
                    response.sendRedirect("urunduzenle.jsp");
                }
            }
    %>
</body>
</html>
