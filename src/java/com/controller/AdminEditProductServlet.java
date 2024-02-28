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
public class AdminEditProductServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminEditProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEditProductServlet at " + request.getContextPath() + "</h1>");
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
        String laptopId_raw = request.getParameter("laptopId");
        String name = request.getParameter("name");
        String inPrice_raw = request.getParameter("inPrice");
        String outPrice_raw = request.getParameter("outPrice");
        String discount_raw = request.getParameter("discount");
        String stock_raw = request.getParameter("stock");
        String card = request.getParameter("card");
        String year = request.getParameter("releaseYear");
        String origin = request.getParameter("origin");
        String system = request.getParameter("system");
        String weight_raw = request.getParameter("weight");
        String description = request.getParameter("description");
        String ramId = request.getParameter("ram");
        String cpuId = request.getParameter("cpu");
        String screenId = request.getParameter("screen");
        String ssdId = request.getParameter("ssd");
        String manuId = request.getParameter("manu");
        String[] image = request.getParameterValues("image");
        String alert = "";
        try {
            int laptopId = Integer.parseInt(laptopId_raw);
            List<String> listImage = WebController.getInstance().laptopdao.getImagesbyLaptopId(laptopId);
            Laptop laptop = WebController.getInstance().laptopdao.getLaptopbyLaptopId(laptopId);
            if (stock_raw != null) {
                boolean result = WebController.getInstance().laptopdao.updateLaptop(laptopId, name, Double.parseDouble(inPrice_raw), Double.parseDouble(outPrice_raw), Integer.parseInt(stock_raw), Integer.parseInt(screenId), Integer.parseInt(cpuId), Integer.parseInt(ramId), Integer.parseInt(ssdId), card, year, origin, Double.parseDouble(discount_raw), system, Integer.parseInt(manuId), Double.parseDouble(weight_raw), description);
                laptop = WebController.getInstance().laptopdao.getLaptopbyLaptopId(laptopId);
                if (result) {
                 if(image.length>1){                   
                     for (int i = 0; i < image.length; i++) {
                        WebController.getInstance().laptopdao.updateImagebyLaptopId(laptopId, image[i], listImage.get(i));
                    }
                 }else {
                     image[0] = listImage.get(0);
                 }
                    
                    alert = "Cập nhật thành công";
                } else {
                    alert = "Cập nhật thất bại";
                }
            }
            request.setAttribute("alert", alert);
            request.setAttribute("laptop", laptop);
            request.getRequestDispatcher("admin_editproduct.jsp").forward(request, response);
        } catch (NumberFormatException e) {
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
