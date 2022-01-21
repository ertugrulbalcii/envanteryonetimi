<%-- 
    Document   : fatura
    Created on : 21.Oca.2022, 12:07:49
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
    <link href="stylesheet/fatura.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    
    <div id="baslik_back">
        <img class="logo" src="ercelik.jpg" alt="logo">
        <h1>ERÇELİK-DEPO</h1> 
    </div>

         <form action="../index.jsp" method="post">
            <input id="cikis_btn" type="submit" value="ÇIKIŞ YAP" />
        </form>
    
        <form action="" method="post">
                  <button class="cikis" name="cikis" type="submit">GERİ</button>
              </form>
    <table class="formdiv1">
                    <tr>
                        <th>isim</th>
                        <th>fiyat</th>
                        <th>adet</th>
                    </tr>
               <%
                 DataBase database =  new DataBase();
        
                int toplam=0;
                int fiyat = 0;
                int stok;
                ResultSet rs= database.sepetgetir();
                   while (rs.next()) {
                       
                          if(rs.getString("stok").equals("0")){
                              System.out.println("DEGER 0)");
                              
                          }else{
                              out.print("<tr>");
                        out.print("<td>" + rs.getString("isim")+"</td>" );
                        out.print("<td>" + rs.getString("fiyat")+"</td>");
                        out.print("<td>" + rs.getString("stok")+"</td>");
                        fiyat = Integer.valueOf( rs.getString("fiyat"));
                        stok = Integer.valueOf( rs.getString("stok"));  
                        toplam = toplam+ (stok* fiyat);
                               out.print("<tr>"); 
                          }
                    }
                    out.print("<p class='toplam'>Sepet toplamı :" +toplam +"</p>");
                   %>
              </table>
              
              
              <%
                  String cikis = request.getParameter("cikis");
                  if (cikis != null) {
                          
                      for (int i = 0; i < 7; i++) {
                       database.sepetGuncelle(i, "0");
                       System.out.println("Buradayız");
                       fiyat=0;
                      }
                      response.sendRedirect("kullanici-giris-sayfa.jsp");
                      }
              %>
</body>
</html>
