<%-- 
    Document   : stok
    Created on : 21.Oca.2022, 01:11:32
    Author     : Ertuğrul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        
        DataBase database =  new DataBase();
        ResultSet rs= database.sepetgetir();
          
                 
                  
         ResultSet rss= database.urunKayitTablo();
           

        %>
    
    
    
    
    
    
    
    
    
</body>
</html>
