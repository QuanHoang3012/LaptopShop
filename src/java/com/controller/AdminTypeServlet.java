/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.cpu.Cpu;
import com.model.manufacturer.Manufacturer;
import com.model.ram.Ram;
import com.model.screen.Screen;
import com.model.ssd.Ssd;
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
public class AdminTypeServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminTypeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminTypeServlet at " + request.getContextPath() + "</h1>");
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
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String alert = "";
        if (type != null) {
            if (type.equals("ram")) {
                if (name != null) {
                    boolean result = WebController.getInstance().ramdao.insertRam(name);
                    if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                String id_raw = request.getParameter("id");
                if(id_raw!=null){
                    boolean result =WebController.getInstance().ramdao.deleteRam(Integer.parseInt(id_raw));
                      if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                List<Ram> list = WebController.getInstance().ramdao.getAll();
                request.setAttribute("type", type);
                request.setAttribute("alert", alert);
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin_addType.jsp").forward(request, response);
            }
            if (type.equals("manu")) {
                if (name != null) {
                    boolean result = WebController.getInstance().manudao.insertManufacturer(name);
                    if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                    String id_raw = request.getParameter("id");
                if(id_raw!=null){
                    boolean result =WebController.getInstance().manudao.deleteManufacturer(Integer.parseInt(id_raw));
                      if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                List<Manufacturer> list = WebController.getInstance().manudao.getAll();
                request.setAttribute("list", list);
                request.setAttribute("type", type);
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("admin_addType.jsp").forward(request, response);
            }
            if (type.equals("cpu")) {
                if (name != null) {
                    boolean result = WebController.getInstance().cpudao.insertCpu(name);
                    if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                    String id_raw = request.getParameter("id");
                if(id_raw!=null){
                    boolean result =WebController.getInstance().cpudao.deleteCpu(Integer.parseInt(id_raw));
                      if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                List<Cpu> list = WebController.getInstance().cpudao.getAll();
                request.setAttribute("type", type);
                request.setAttribute("list", list);
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("admin_addType.jsp").forward(request, response);
            }
            if (type.equals("screen")) {
                if (name != null) {
                    boolean result = WebController.getInstance().screendao.insertScreen(name);
                    if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                    String id_raw = request.getParameter("id");
                if(id_raw!=null){
                    boolean result =WebController.getInstance().screendao.deleteScreen(Integer.parseInt(id_raw));
                      if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                List<Screen> list = WebController.getInstance().screendao.getAll();
                request.setAttribute("list", list);
                request.setAttribute("type", type);
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("admin_addType.jsp").forward(request, response);
            }
            if (type.equals("ssd")) {
                if (name != null) {
                    boolean result = WebController.getInstance().ssddao.insertSsd(name);
                    if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                    String id_raw = request.getParameter("id");
                if(id_raw!=null){
                    boolean result =WebController.getInstance().ssddao.deleteSsd(Integer.parseInt(id_raw));
                      if (result) {
                        alert = "Successful";
                    } else {
                        alert = "Failed";
                    }
                }
                List<Ssd> list = WebController.getInstance().ssddao.getAll();
                request.setAttribute("type", type);
                request.setAttribute("list", list);
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("admin_addType.jsp").forward(request, response);
            }
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
