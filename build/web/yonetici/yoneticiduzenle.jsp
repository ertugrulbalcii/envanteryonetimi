<%-- 
    Document   : yoneticiduzenle
    Created on : 16.Oca.2022, 23:27:22
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
    <link rel="stylesheet" href="stylesheet/yoneticiduzenle.css" type="text/css"/>
</head>
<body>
    <div id="baslik_back">
        <img class="logo" src="ercelik.jpg" alt="logo">
        <h1>ERÇELİK-DEPO</h1> 
    </div>
<table class="formdiv1">
                    <tr>
                        <th>ad</th>
                        <th>soyad</th>
                        <th>telefon</th>
                        <th>eposta</th>
                        <th>kullaniciadi</th>
                        <th>sifre1</th>
                        <th>sifre2</th>
                        <th>düzenle</th>
                    </tr>
                   
               <%
                  DataBase database =  new DataBase();
                  ResultSet result = database.yoneticiKayitTablo();
                while (result.next()) {
                        out.print("<tr>");
                        out.print("<td>" + result.getString("ad")+"</td>" );
                        out.print("<td>" + result.getString("soyad")+"</td>");
                        out.print("<td>" + result.getString("telefon")+"</td>");
                        out.print("<td>" + result.getString("eposta")+"</td>");
                        out.print("<td>" + result.getString("kullaniciadi")+"</td>");
                        out.print("<td>" + result.getString("sifre1")+"</td>");
                        out.print("<td>" + result.getString("sifre2")+"</td>");
               %>
               <td><a href="yoneticiduzenle.jsp?id=<%= result.getString("id")%>">Bilgileri Sil</a></td>
                <td><a href="yoneticiduzenle.jsp?edit=<%= result.getString("id")%>">güncelle</a></td>
                    <%
                        out.print("<tr>");
                    }
                        HttpSession oturum = request.getSession(true);
                        String guncelle = request.getParameter("edit");
                        String sil = request.getParameter("id");
                        oturum.setAttribute("edit", guncelle);
                         if(sil != null){
                            database.yoneticisil(Integer.valueOf(sil));
                            response.sendRedirect("yoneticiduzenle.jsp");
                        }
                        if(guncelle != null){
                           response.sendRedirect("yoneticiguncelle.jsp");
}
                       
              %>
    </table>
   
<div id="formdiv">
    <form action="">
        <input class="ad" name="firstname" placeholder="ad"/><br>
        <input class="ad" name="lastname" placeholder="soyad"/><br>
        <input class="ad" name="number" placeholder="telefon"/><br>
        <input class="ad" name="email" placeholder="eposta"/><br>
        <input class="ad" name="kullaniciadi" placeholder="kullanıcı adı"/><br>
        <input class="ad" name="password1" placeholder="sifre1"/><br>
        <input class="ad" name="password2" placeholder="sifre2"/><br>
        <button class="ad1" name="ekle" type="submit">ekle</button>
    </form>
    <form action="yonetici-giris-sayfa.jsp">
                       <button class="ad2" name="cikis" type="submit">ÇIKIŞ YAP</button>
                   </form>
</div>
    
    <%
        
                String firstname =request.getParameter("firstname");
                String lastname =request.getParameter("lastname");
                String number =request.getParameter("number");
                String email =request.getParameter("email");
                String kullaniciadi =request.getParameter("kullaniciadi");
                String password1 =request.getParameter("password1");
                String password2 =request.getParameter("password2");
                String ekle =request.getParameter("ekle");
                
                yonetici yonetici= new yonetici(firstname, lastname, number, email,kullaniciadi ,password1, password2);
                DataBase dt = new DataBase();
                if(ekle != null){
                    if (!firstname.equals("") && !lastname.equals("")&& !number.equals("")&& !email.equals("")&&
                           !kullaniciadi.equals("") && !password1.equals("")&& !password2.equals("")) {
                            System.out.println("hata yok");
                            dt.yoneticiekleme(yonetici);
                            response.sendRedirect("yoneticiduzenle.jsp");
                        }
                    }
                
    %>
</body>
</html>
