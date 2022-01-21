<%-- 
    Document   : kullanici-giris-sayfa
    Created on : 16.Oca.2022, 13:14:08
    Author     : Ertuğrul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.DataBase"%>
<%@page import="java.sql.*"%>
<%@page import="data.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="stylesheet/kullanici-giris.css" type="text/css"/>
</head>
<body>
 
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <style>
         
     </style>
</head>
<body>
    <%
        HttpSession ot = request.getSession(true);
        String adM = ot.getAttribute("adMusteri").toString();
    %>
    <div id="baslik_back">
        <img class="logo" src="ercelik.jpg" alt="logo">
        <h1 class="isim1">Hoş geldiniz <%= adM%></h1> 
    </div>

         <form action="../index.jsp" method="post">
            <input id="cikis_btn" type="submit" value="ÇIKIŞ YAP" />
        </form>

        <form action="sepet.jsp" method="post">
  <button class="sepet" type="submit">
    SEPET
</button>  
</form>
   
<table class="formdiv1">
                    <tr>
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
               <td><a href="kullanici-giris-sayfa.jsp?sepet=<%= result.getString("id")%>">sepete ekle</a></td>
                    <%
                        out.print("<tr>");
                    }
                      
                        
                        String sepet = null;
                        sepet = request.getParameter("sepet");
                        String ismi="";
                        String fiyat="";
                        int stok = 0;
                       
                        if(sepet !=null){
                      
                        ResultSet rs= database.sepetal(sepet);
                        while (rs.next()) {
                          ismi= rs.getString("ismi");
                          fiyat = rs.getString("fiyat");
                          
                        }
                        
                        ResultSet rss= database.sepetall(sepet);
                        while (rss.next()) {
                          stok =Integer.valueOf(rss.getString("stok"))+1 ;
                          
                        }



                           database.sepetGuncelle(sepet, ismi, fiyat,String.valueOf(stok) );
                             
                            }




                         
                   
                                                   
              %>
</table>


        
</body>
</html>
