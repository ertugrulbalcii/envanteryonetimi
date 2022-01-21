package data;

public class urunler {
    private String isim;
    private String fiyat;
    private String stok;
    
    
    public urunler(String isim,String fiyat, String stok){
        this.isim = isim;
        this.fiyat = fiyat;
        this.stok= stok;
    }

    public String getIsim() {
        return isim;
    }

    public void setIsim(String isim) {
        this.isim = isim;
    }

    public String getFiyat() {
        return fiyat;
    }

    public void setFiyat(String fiyat) {
        this.fiyat = fiyat;
    }

    public String getStok() {
        return stok;
    }

    public void setStok(String stok) {
        this.stok = stok;
    }
    
}
