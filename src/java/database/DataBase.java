package database;

import java.sql.*;
import data.*;

public class DataBase {
    static final String DB_URL = "jdbc:mysql://localhost:3306/envanterdepo";
    static final String USER="root";
    static final String PASSWORD="root";
    
    public static void musteriekleme(musteriler musteri) {

        PreparedStatement psnt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("321");
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            System.out.println("123");
            String sql ="INSERT INTO musteri(ad,soyad,telefon,eposta,kullaniciadi,sifre1,sifre2) VALUES( ?, ?, ?, ?, ?, ?, ?)";
            psnt = con.prepareStatement(sql);
            
            psnt.setString(1,musteri.getAd());
            psnt.setString(2,musteri.getSoyad());
            psnt.setString(3,musteri.getTelefon());
            psnt.setString(4,musteri.getEposta());
            psnt.setString(5,musteri.getKullaniciadi());
            psnt.setString(6,musteri.getSifre1());
            psnt.setString(7,musteri.getSifre2());
           
            psnt.executeUpdate();
           // veri tabanı kullanıldıktan sonra kapatılıyor

            psnt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
        }
    }
     public static void yoneticiekleme(yonetici yonetici) {

        PreparedStatement psnt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("321");
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            System.out.println("123");
            String sql ="INSERT INTO yonetici(ad,soyad,telefon,eposta,kullaniciadi,sifre1,sifre2) VALUES( ?, ?, ?, ?, ?, ?, ?)";
            psnt = con.prepareStatement(sql);
            
            psnt.setString(1,yonetici.getAd());
            psnt.setString(2,yonetici.getSoyad());
            psnt.setString(3,yonetici.getTelefon());
            psnt.setString(4,yonetici.getEposta());
            psnt.setString(5,yonetici.getKullaniciadi());
            psnt.setString(6,yonetici.getSifre1());
            psnt.setString(7,yonetici.getSifre2());
           
            psnt.executeUpdate();
           // veri tabanı kullanıldıktan sonra kapatılıyor

            psnt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
        }
    }
     public  void yoneticisil(int id){
     Connection conn = null;
         PreparedStatement sorgu = null;


          try {
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

             sorgu = conn.prepareStatement("DELETE   FROM yonetici WHERE ID='" + id + "'");
             sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
    }
     
     public  void personelsil(int id){
     Connection conn = null;
         PreparedStatement sorgu = null;


          try {
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

             sorgu = conn.prepareStatement("DELETE   FROM musteri WHERE ID='" + id + "'");
             sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
    }
    public String hesapKontrolmusteri(String kullaniciAd, String sifre){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;
        boolean durum =false;
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM musteri";
            rst = st.executeQuery(sql);
            
            while(rst.next()){
                if(rst.getString("kullaniciadi").equals(kullaniciAd) && rst.getString("sifre1").equals(sifre)){
                    return "musteri";
                }else{
                    durum = false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " + e);

        }
        return "hesap yok";
    }
    
    public String hesapKontrolyonetici(String kullaniciAd, String sifre){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;
        boolean durum =false;
        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM yonetici";
            rst = st.executeQuery(sql);
            
            while(rst.next()){
                if(rst.getString("kullaniciadi").equals(kullaniciAd) && rst.getString("sifre1").equals(sifre)){
                    return "admin";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : " + e);

        }
        return "hesap yok";
    }
    public ResultSet musteriKayitTablo(){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM musteri";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );
        }
        return rst;
    }
    public ResultSet yoneticiKayitTablo(){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM yonetici";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );
        }
        return rst;
    }
    public static void urunekleme(urunler urun) {

        PreparedStatement psnt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            String sql ="INSERT INTO urunler(ismi,fiyat, stok) VALUES( ?, ?, ?)";
            psnt = con.prepareStatement(sql);
            
            psnt.setString(1,urun.getIsim());
            psnt.setString(2,urun.getFiyat());
            psnt.setString(3,urun.getStok());
            psnt.executeUpdate();
           // veri tabanı kullanıldıktan sonra kapatılıyor

            psnt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("HATA :  "+ e);
        }
    }
     public ResultSet urunKayitTablo(){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM urunler";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA : "+e );
        }
        return rst;
    }
      public  void urunsil(int id){
     Connection conn = null;
         PreparedStatement sorgu = null;


          try {
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

             sorgu = conn.prepareStatement("DELETE   FROM urunler WHERE id='" + id + "'");
             sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
    }
      public static void urunGuncelle(int ID, String isim, String fiyat,String stok){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            PreparedStatement sorgu = conn.prepareStatement("UPDATE urunler SET ismi ='" + isim + "', fiyat='" + fiyat + "', stok='" + stok + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("KULLANICI GÜNCELLEMEDE HATA");
        }
    } 
    public static void musteriGuncelle(int ID, String ad, String soyad, String telefon, String eposta, String kullaniciadi, String sifre1, String sifre2){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            PreparedStatement sorgu = conn.prepareStatement("UPDATE musteri SET ad ='" + ad + "', soyad='" + soyad + "', telefon='" + telefon + "', eposta='" +
                    eposta +  "', kullaniciadi='" + kullaniciadi + "', sifre1='" + sifre1 + "', sifre2='" + sifre2 + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("KULLANICI GÜNCELLEMEDE HATA");
        }
    } 
    
    public static void yoneticiGuncelle(int ID, String ad, String soyad, String telefon, String eposta, String kullaniciadi, String sifre1, String sifre2){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            PreparedStatement sorgu = conn.prepareStatement("UPDATE yonetici SET ad ='" + ad + "', soyad='" + soyad + "', telefon='" + telefon + "', eposta='" +
                    eposta +  "', kullaniciadi='" + kullaniciadi + "', sifre1='" + sifre1 + "', sifre2='" + sifre2 + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("KULLANICI GÜNCELLEMEDE HATA");
        }
    } 
    
    
    
     public static void sepetGuncelle(String ID, String isim, String fiyat,String stok){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            PreparedStatement sorgu = conn.prepareStatement("UPDATE sepet SET isim ='" + isim + "', fiyat='" + fiyat + "', stok='" + stok + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("sepet ");
        }
    } 
    
    
         public ResultSet sepetal(String id){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM urunler WHERE ID='" + id + "'";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA sepet: "+e );
        }
        return rst;
    }
       
    public ResultSet sepetall(String id){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM sepet WHERE ID='" + id + "'";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA sepet: "+e );
        }
        return rst;
    }   
       
    
      public ResultSet sepetgetir( ){
        Connection con =null;
        Statement st = null;
        ResultSet rst=null;

        try {
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = con.createStatement();
            String sql ="SELECT * FROM sepet";
            rst = st.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" HATA sepet: "+e );
        }
        return rst;
    } 
    
    public static void stokGuncelle(int ID, int stok){
        Connection conn = null;
        Statement st = null;
        ResultSet rst=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            st = conn.createStatement();
            rst = st.executeQuery("Select * from urunler");
            
            while(rst.next()){
                PreparedStatement sorgu = conn.prepareStatement("UPDATE urunler SET  stok='" + (Integer.valueOf(rst.getString("stok")) - stok) + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
                System.out.println("ID: " + rst.getInt("id") + " stok: " + rst.getInt("stok"));
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("stok GÜNCELLEMEDE HATA");
        }
    } 
      
      
    public static void sepetGuncelle(int ID, String stok){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            PreparedStatement sorgu = conn.prepareStatement("UPDATE sepet SET  stok='" + stok + "' WHERE id='" + ID + "'");
            sorgu.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("stok GÜNCELLEMEDE HATA");
        }
    } 
          
      
}
