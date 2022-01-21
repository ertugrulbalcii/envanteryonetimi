<%-- 
    Document   : urunduzenle
    Created on : 16.Oca.2022, 23:27:30
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
    <link rel="stylesheet" href="stylesheet/urunduzenle.css" type="text/css"/>
</head>
<body>
    <h1>ürün düzenle</h1>
    
    <div id="baslik_back">
        <img class="logo" src="ercelik.jpg" alt="logo"/>
        <h1>ERÇELİK-DEPO</h1> 
        <form action="yonetici-giris-sayfa.jsp">
        <button class="ad2" name="cikis" type="submit">GERİ</button>
        </form>
        <form action="">
            <div class="sol_ark">
            <label class='sol'>urunadı</label><br>
            <input class='sol' type="text" name="isim"/><br>
            <label class='sol1'>urunfiyat</label><br>
            <input class='sol1' type="text" name="fiyat"/><br>
              <label class='sol2'>stok adeti</label><br>
             
            <input class='sol2' type="text" name="stok"/><br>
            
            
            <button class="ekle" type="submit" name="ekle">ekle</button>
            </div>
            
        </form>
    </div>

<table class="urunform">
    <tr class="urunform1">
                        <th>urun adı</th>
                        <th>urun fiyatı</th>
                        <th>stok</th>
                    </tr>
               <%
                  DataBase database =  new DataBase();
                  ResultSet result = database.urunKayitTablo();
                while (result.next()) {
                        out.print("<tr>");
                            out.print("<td>" + result.getString("ismi")+"</td>" );
                            out.print("<td>" + result.getString("fiyat")+"</td>");
                            out.print("<td>" + result.getString("stok")+"</td>");
               %>
               <td><a href="urunduzenle.jsp?id=<%= result.getString("id")%>">Bilgileri Sil</a></td>
               <td><a href="urunduzenle.jsp?edit=<%= result.getString("id")%>">güncelle</a></td>
                    <%
                        out.print("<tr>");
                    }
                        HttpSession oturum = request.getSession(true);
                        String guncelle = request.getParameter("edit");
                        String sil = request.getParameter("id");
                        oturum.setAttribute("edit", guncelle);
                        if(sil != null){
                            database.urunsil(Integer.valueOf(sil));
                            response.sendRedirect("urunduzenle.jsp");
                        }
                        if(guncelle != null){
                           response.sendRedirect("urunguncelle.jsp");
}
                                                   
              %>
</table>

<%
String isim = request.getParameter("isim");
String fiyat = request.getParameter("fiyat");
String stok = request.getParameter("stok");
String ekle = request.getParameter("ekle");
String cikis = request.getParameter("cikis");

urunler urun= new urunler(isim, fiyat,stok);
DataBase dt = new DataBase();
if(ekle != null){
                    if (!isim.equals("") && !fiyat.equals("")) {
                            System.out.println("hata yok");
                            dt.urunekleme(urun);
                            response.sendRedirect("urunduzenle.jsp");
                        }
                    }
else if(cikis != null){
    response.sendRedirect("yonetici-giris-sayfa.jsp");
}
                
%>
    
</body>
</html>
