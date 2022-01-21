package org.apache.jsp.yonetici;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import database.DataBase;
import data.*;
import java.sql.*;

public final class urunduzenle_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>JSP Page</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"stylesheet/urunduzenle.css\" type=\"text/css\"/>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <h1>ürün düzenle</h1>\n");
      out.write("    \n");
      out.write("    <div id=\"baslik_back\">\n");
      out.write("        <img class=\"logo\" src=\"ercelik.jpg\" alt=\"logo\"/>\n");
      out.write("        <h1>ERÇELİK-DEPO</h1> \n");
      out.write("        <form action=\"\">\n");
      out.write("            <label>urunadı</label><br>\n");
      out.write("            <input type=\"text\" name=\"isim\"/><br>\n");
      out.write("            <label>urunfiyat</label><br>\n");
      out.write("            <input type=\"text\" name=\"fiyat\"/><br>\n");
      out.write("            <button type=\"submit\" name=\"ekle\">ekle</button>\n");
      out.write("            <button class=\"ad2\" name=\"cikis\" type=\"submit\">ÇIKIŞ YAP</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("<table class urunform>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>urun adı</th>\n");
      out.write("                        <th>urun fiyatı</th>\n");
      out.write("                    </tr>\n");
      out.write("               ");

                  DataBase database =  new DataBase();
                  ResultSet result = database.urunKayitTablo();
                while (result.next()) {
                        out.print("<tr>");
                            out.print("<td>" + result.getString("ismi")+"</td>" );
                            out.print("<td>" + result.getString("fiyat")+"</td>");
               
      out.write("\n");
      out.write("               <td><a href=\"urunduzenle.jsp?id=");
      out.print( result.getString("id"));
      out.write("\">Bilgileri Sil</a></td>\n");
      out.write("               <td><a href=\"urunduzenle.jsp?edit=");
      out.print( result.getString("id"));
      out.write("\">güncelle</a></td>\n");
      out.write("                    ");

                        out.print("<tr>");
                    }
                        HttpSession oturum = request.getSession(true);
                        String guncelle = request.getParameter("edit");
                        String sil = request.getParameter("id");
                        oturum.setAttribute("edit", guncelle);
                        if(sil != null){
                            database.urunsil(Integer.valueOf(sil));
                            response.sendRedirect("urunduzenle.jsp");
                        }
                        if(guncelle != null){
                           response.sendRedirect("urunguncelle.jsp");
}
                                                   
              
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");

String isim = request.getParameter("isim");
String fiyat = request.getParameter("fiyat");
String ekle = request.getParameter("ekle");
String cikis = request.getParameter("cikis");

urunler urun= new urunler(isim, fiyat);
DataBase dt = new DataBase();
if(ekle != null){
                    if (!isim.equals("") && !fiyat.equals("")) {
                            System.out.println("hata yok");
                            dt.urunekleme(urun);
                            response.sendRedirect("urunduzenle.jsp");
                        }
                    }
else if(cikis != null){
    response.sendRedirect("yonetici-giris-sayfa.jsp");
}
                

      out.write("\n");
      out.write("    \n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
