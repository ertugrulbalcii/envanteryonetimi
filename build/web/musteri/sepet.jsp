<%-- 
    Document   : sepet
    Created on : 19.Oca.2022, 16:06:51
    Author     : Ertuğrul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.*"%>
<%@page import="java.sql.*"%>
<%@page import="data.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="stylesheet/sepet.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    
    <div id="baslik_back">
        <img class="logo" src="ercelik.jpg" alt="logo">
        <h1>ERÇELİK-DEPO</h1> 
    </div>

         <form action="../index.jsp" method="post">
            <input id="cikis_btn" type="submit" value="ÇIKIŞ YAP" />
        </form>
    
         <table id="personel_tablo">
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
                   
%>

              </table>
              <form action="" method="post">
                  <input class="onay" type="submit"  name="btnOnay" value="ONAYLA" />
              </form>
            
              <form action="" method="post">
                  <input class="geri" type="submit" name="btnGeri" value="geri" />
              </form>
              <%
                  ResultSet rss= database.sepetgetir();
                  String btnOnay = request.getParameter("btnOnay");
                  String btnGeri = request.getParameter("btnGeri");
                 
                  if (btnOnay != null) {
                      System.out.println("btnOnay");
                      if(rss.next()){
                          System.out.println("Next ok");
                      }
                      else{
                          System.out.println("Next yok");
                      }
                      while(rss.next()){
                          database.stokGuncelle(rss.getInt("id"), rss.getInt("stok"));
                          System.out.println("sepet id: " + rss.getInt("id") + " sepet stok: " + rss.getInt("stok"));
                      }
                          response.sendRedirect("fatura.jsp");
                          
                      }  if(btnGeri != null){
                        response.sendRedirect("kullanici-giris-sayfa.jsp");
                    }


                  %>
    
    
    
</body>
</html>
