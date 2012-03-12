

package org.opengis.nix.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
/**
 *
 * @author XPSQL
 */
public class InformeCuaderno extends HttpServlet {

	/**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    	//String img="C:/Documents and Settings/de/Documents/workspace-sts-2.9.0.RELEASE/OpenGisNix/src/main/webapp/WEB-INF/mascota.png";
    	//String img2="C:/Documents and Settings/de/Documents/workspace-sts-2.9.0.RELEASE/OpenGisNix/src/main/webapp/WEB-INF/FLORIDA.png";
        String img="WEB-INF/mascota.png";
        String img2="WEB-INF/FLORIDA.png";
    	response.setContentType("application/pdf");
 ServletOutputStream out = response.getOutputStream();
 response.getContentType();
 try
 {
    JasperReport reporte = (JasperReport) JRLoader.loadObject(getServletContext().getRealPath("WEB-INF/InformeCuaderno.jasper"));
    //JasperReport reporte2 = (JasperReport) JRLoader.loadObject(getServletContext().getRealPath("WEB-INF/InformeCuaderno2.jasper"));
    Map<String, Object> parametros = new HashMap<String, Object>();
    parametros.put("dni", request.getParameter("dni"));
    //parametros.put("img", this.getClass().getResourceAsStream(img));
    //parametros.put("img2", this.getClass().getResourceAsStream(img2));
    parametros.put("img","C:\\Documents and Settings\\de\\Documents\\workspace-sts-2.9.0.RELEASE\\OpenGisNix\\src\\main\\webapp\\WEB-INF\\mascota.png");

    JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parametros, ConnectorServlets.conectar());
    //JasperPrint jasperPrint2 = JasperFillManager.fillReport(reporte2, null, ConnectorServlets.conectar());

    JRExporter exporter = new JRPdfExporter();
    exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
    //exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint2);
    exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
    exporter.exportReport();
 }
 catch (Exception e)
 {
    e.printStackTrace();
 }finally{
	 try {
		ConnectorServlets.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
 }
 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
