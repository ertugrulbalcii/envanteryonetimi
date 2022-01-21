<%-- 
    Document   : kullanici
    Created on : 12.Oca.2022, 19:39:31
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
        <title>OTURUM AÇ</title>
        <link rel="stylesheet" href="stylesheet/kullanici.css" type="text/css"/>
</head>
<body>
    <center>
        
    <div class="baslika">
        <h1 class="h">ERÇELİK-DEPO</h1>
    </div>    
    
    <div class="baslik1">
        <h1 class="h1">OTURUM AÇ</h1>
    </div> 
   


    <div>
        
        <form id="contact" action="" method="post">
            <input class="ad" name="kullaniciadi" placeholder="Kullanıcı adı" type="input"/><br>
            <input class="pw1" name="password" placeholder="Şifre" type="password"/><br>
            <button class="btn" name="giris" type="submit" id="contact-submit" data-submit="...Sending">GİRİŞ</button>
            <input type="checkbox" name="remember" id="remember">Beni hatırla
        </form>
    </div>
    </center>
<%
        boolean remember = request.getParameter("remember") != null;
        Cookie ckUsername = null;
        Cookie ckPassword = null;
        Cookie durum = null;
        String passWord = "";
        String userName = "";
        HttpSession oturum = request.getSession(true);
    
            DataBase database = new DataBase();
            String kullaniciadi = request.getParameter("kullaniciadi");
            String passwordd = request.getParameter("password");
            String giris = request.getParameter("giris");
            
            if(kullaniciadi != null && passwordd != null && giris != null){
                  ckUsername = new Cookie("usernameMusteri", kullaniciadi);
                  ckPassword = new Cookie("passwordMusteri", passwordd);
                  durum = new Cookie("durum", "false");
                  oturum.setAttribute("adMusteri", kullaniciadi);
                 
             }
            
            Cookie[] allCookies = request.getCookies();
         if (allCookies != null) {
                 for(Cookie cook: allCookies){
                     if(cook.getName().equalsIgnoreCase("usernameMusteri")){
                         userName = cook.getValue();
                     }
                     else if(cook.getName().equalsIgnoreCase("passwordMusteri")){
                         passWord = cook.getValue();
                     }
                     
                 }
             }
         
         if(allCookies != null){
             for(int i = 0; i < allCookies.length; i++){
                 System.out.println(allCookies[i].getValue());
             if(allCookies[i].getValue().contains(database.hesapKontrolmusteri(userName, passWord))){
                      response.sendRedirect(request.getContextPath() + "/musteri/kullanici-giris-sayfa.jsp");
                      break;
                  }
             else{
                 System.out.println("bulunamadi");
             }
         }
         }
         
  if (kullaniciadi != null && passwordd != null) {
                if (database.hesapKontrolmusteri(kullaniciadi, passwordd).equals("musteri")) {
                     if(remember){
                         ckUsername.setMaxAge(300);
                         response.addCookie(ckUsername);
                         ckPassword.setMaxAge(300);
                         response.addCookie(ckPassword);
                         durum.setMaxAge(0);
                         response.addCookie(durum);
        }else{          
                            durum.setMaxAge(300);
                         response.addCookie(durum);
                        }  
                        response.sendRedirect("kullanici-giris-sayfa.jsp");
                    }
                  
else{
                out.println("\t Bilgiler yanlış");
            }
                 }
%>
</body>
</html>
