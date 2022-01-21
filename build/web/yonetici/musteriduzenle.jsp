<%-- 
    Document   : musteriduzenle
    Created on : 16.Oca.2022, 23:26:36
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
      <link rel="stylesheet" href="stylesheet/musteriduzenle.css" type="text/css"/>
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
                    </tr>
               <%
                  DataBase database =  new DataBase();
                  ResultSet result = database.musteriKayitTablo();
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
               <td><a href="musteriduzenle.jsp?id=<%= result.getString("id")%>">Bilgileri Sil</a></td>
                <td><a href="musteriduzenle.jsp?edit=<%= result.getString("id")%>">güncelle</a></td>
                    <%
                        out.print("<tr>");
                    }
                    HttpSession oturum = request.getSession(true);
                        String guncelle = request.getParameter("edit");
                        String sil = request.getParameter("id");
                        oturum.setAttribute("edit", guncelle);
                         if(sil != null){
                            database.personelsil(Integer.valueOf(sil));
                            response.sendRedirect("musteriduzenle.jsp");
                        }
                        if(guncelle != null){
                           response.sendRedirect("musteriguncelle.jsp");
}
                       
              %>
              </table>
    <div id="formdiv">
        
        <form id="contact" action="" method="post">
            <input class="ad" name="firstname" placeholder="Adınız" type="input"/><br>
            <input class="ad" name="lastname" placeholder="Soyadınız" type="input"/><br>
            <input class="ad" name="number" placeholder="Telefon(555-555-55-55)" type="input"/><br>
            <input class="ad" name="email" placeholder="E-posta" type="input"/><br>
            <input class="ad" name="kullaniciadi" placeholder="kullanıcı adı" type="input"/><br>
            <input class="ad" name="password1" placeholder="Şifre" type="password"/><br>
            <input class="ad" name="password2" placeholder="Şifreyi Tekrar Giriniz" type="password"/><br>
            <button class="ad1" name="ekle" type="submit" id="contact-submit" data-submit="...Sending">ekle</button>
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
                
                musteriler musteri= new musteriler(firstname, lastname, number, email,kullaniciadi ,password1, password2);
                DataBase dt = new DataBase();
                if(ekle != null){
                    if (!firstname.equals("") && !lastname.equals("")&& !number.equals("")&& !email.equals("")&&
                           !kullaniciadi.equals("") && !password1.equals("")&& !password2.equals("")) {
                     
                            System.out.println("hata yok");
                            dt.musteriekleme(musteri);
                            response.sendRedirect("musteriduzenle.jsp");
                        }
                    }
                
            %>
              
</body>
</html>
