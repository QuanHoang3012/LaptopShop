/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.laptop.Laptop;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Anh Quan
 */
public class AdminAddServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminAddServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("nameAdd");
        String inPrice_raw = request.getParameter("inPriceAdd");
        String outPrice_raw = request.getParameter("outPriceAdd");
        String discount_raw = request.getParameter("discountAdd");
        String stock_raw = request.getParameter("stockAdd");
        String card = request.getParameter("cardAdd");
        String year = request.getParameter("releaseYearAdd");
        String origin = request.getParameter("originAdd");
        String system = request.getParameter("systemAdd");
        String weight_raw = request.getParameter("weightAdd");
        String description = request.getParameter("descriptionAdd");
        String ramId = request.getParameter("ramAdd");
        String cpuId = request.getParameter("cpuAdd");
        String screenId = request.getParameter("screenAdd");
        String ssdId = request.getParameter("ssdAdd");
        String manuId = request.getParameter("manuAdd");
        String[] image = request.getParameterValues("imageAdd");
        String alert = "";
        System.out.println(outPrice_raw);
        try {
                outPrice_raw = outPrice_raw.replace(".", " ");
                inPrice_raw = inPrice_raw.replace(".", " ");
                discount_raw = discount_raw.replace(".", " ");
           
                boolean result =WebController.getInstance().laptopdao.insertLaptop(name, Float.parseFloat(inPrice_raw), Float.parseFloat(outPrice_raw), Integer.parseInt(stock_raw), Integer.parseInt(screenId), Integer.parseInt(cpuId), Integer.parseInt(ramId), Integer.parseInt(ssdId), card, year, origin, Float.parseFloat(discount_raw), system, Integer.parseInt(manuId), Double.parseDouble(weight_raw), description);
               
                if(result){
                     if(image!=null){
                        int laptopId = WebController.getInstance().laptopdao.getLastLaptopIdAdded();
                        for(int i=0;i<image.length;i++){
                            WebController.getInstance().laptopdao.insertImageByLaptopId(laptopId, image[i]);
                        }
                     }
                    alert = "Add successfull";
                }else alert="Add failed";
            
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("admin_addLaptop.jsp").forward(request, response);
        } catch (IOException e) {
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
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
