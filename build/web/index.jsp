<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
     <link rel="stylesheet" href="stylesheet/index.css" type="text/css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
</head>
<body>
    <div id="baslik_back">
        <img class="logo" src="ercelik.jpg" alt="logo">
        <h1>ERÇELİK-DEPO</h1>
    </div>
<header>
    <form action="yonetici/yonetici.jsp" method="post">
        <input id="admin_btn" type="submit" value="YÖNETİCİ GİRİŞİ" />
    </form>
    
    <form action="musteri/kullanici.jsp" method="post">
        <input  id="user_btn" type="submit" value="KULLANICI GİRİŞİ" />
    </form>

    <form  action="kayit.jsp" method="post">
        <button id="add_btn" type="submit"  >
            </svg>  KAYIT OL
        </button>
    </form>
</header>
     
    <div class="ilk">
        <center>
        <img class="ilk_img" src="beyaz_eşya.jpg" alt="beyaz eşya">
        <h2 class="ilk_p">BEYAZ EŞYALAR</h2>
        </center>
    </div>
   
    <div class="iki">
        <center>
        <img class="iki_img" src="elektronik.jpg" alt="elektronik eşya">
        <h2 class="iki_p">ELEKTRONİK EŞYALAR</h2>
        </center>
    </div>
    
</body>
</html>
