<%-- 
    Document   : kayit
    Created on : 12.Oca.2022, 19:32:00
    Author     : Ertuğrul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="data.*"%>
<%@page import="java.sql.*"%>
<%@page import="database.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="stylesheet/kayit.css" type="text/css"/>
</head>
<body>
  
    
   

    <div class="baslik">
        <h1 class="h">ERÇELİK-DEPO</h1>
    </div>    
    <center>
    <div class="baslik1">
        <h1 class="h1">KAYIT FORMU</h1>
    </div> 

    <div>
        
        <form id="contact" action="" method="post">
            <input class="ad" name="firstname" placeholder="Adınız" type="input"/>
            <input class="soyad" name="lastname" placeholder="Soyadınız" type="input"/>
            <input class="tel" name="number" placeholder="Telefon(555-555-55-55)" type="input"/>
            <input class="mail" name="email" placeholder="E-posta" type="input"/>
            <input class="mail" name="kullaniciadi" placeholder="kullanıcı adı" type="input"/>
            <input class="pw1" name="password1" placeholder="Şifre" type="password"/>
            <input class="pw2" name="password2" placeholder="Şifreyi Tekrar Giriniz" type="password"/>
            <button class="btn" name="kaydol" type="submit" id="contact-submit" data-submit="...Sending">KAYDOL</button>
        </form>
       
       
    </div>
    </center>



            <%
                String firstname =request.getParameter("firstname");
                String lastname =request.getParameter("lastname");
                String number =request.getParameter("number");
                String email =request.getParameter("email");
                String kullaniciadi =request.getParameter("kullaniciadi");
                String password1 =request.getParameter("password1");
                String password2 =request.getParameter("password2");
                String kaydol =request.getParameter("kaydol");
                
                musteriler musteri= new musteriler(firstname, lastname, number, email,kullaniciadi ,password1, password2);
                DataBase dt = new DataBase();
                if(kaydol != null){
                    if (!firstname.equals("") && !lastname.equals("")&& !number.equals("")&& !email.equals("")&&
                           !kullaniciadi.equals("") && !password1.equals("")&& !password2.equals("")) {
                     
                            System.out.println("hata yok");
                            dt.musteriekleme(musteri);
                            response.sendRedirect("musteri/kullanici.jsp");
                        }
                    }
                
            %>
</body>
</html>
