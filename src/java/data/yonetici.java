package data;

public class yonetici {
    private String ad;
    private String soyad;
    private String telefon;
    private String eposta;
    private String kullaniciadi;
    private String sifre1;
    private String sifre2;
    public yonetici(String ad,String soyad,String telefon,String eposta,String kullaniciadi,String sifre1,String sifre2){
        this.ad = ad;
        this.soyad = soyad;
        this.telefon = telefon;
        this.eposta = eposta;
        this.kullaniciadi =kullaniciadi;
        this.sifre1 = sifre1;
        this.sifre2 = sifre2;
        
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad) {
        this.soyad = soyad;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getEposta() {
        return eposta;
    }

    public void setEposta(String eposta) {
        this.eposta = eposta;
    }

    public String getKullaniciadi() {
        return kullaniciadi;
    }

    public void setKullaniciadi(String kullaniciadi) {
        this.kullaniciadi = kullaniciadi;
    }

    public String getSifre1() {
        return sifre1;
    }

    public void setSifre1(String sifre1) {
        this.sifre1 = sifre1;
    }

    public String getSifre2() {
        return sifre2;
    }

    public void setSifre2(String sifre2) {
        this.sifre2 = sifre2;
    }
    
}
