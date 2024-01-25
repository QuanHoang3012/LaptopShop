/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.cpu.Cpu;
import com.model.cpu.CpuDAO;
import com.model.laptop.Laptop;
import com.model.laptop.LaptopDAO;
import com.model.manufacturer.Manufacturer;
import com.model.manufacturer.ManufacturerDAO;
import com.model.ram.Ram;
import com.model.ram.RamDAO;
import com.model.screen.Screen;
import com.model.screen.ScreenDAO;
import com.model.ssd.Ssd;
import com.model.ssd.SsdDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anh Quan
 */
public class laptopServlet extends HttpServlet {

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
            out.println("<title>Servlet laptopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet laptopServlet at " + request.getContextPath() + "</h1>");
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
        LaptopDAO ldb = new LaptopDAO();
        ManufacturerDAO mdb = new ManufacturerDAO();
        RamDAO rdb = new RamDAO();
        CpuDAO cdb = new CpuDAO();
        ScreenDAO scdb = new ScreenDAO();
        SsdDAO ssdb = new SsdDAO();
        
        List<Screen> listScreen = scdb.getAll();
        List<Ssd> listSsd = ssdb.getAll();
        List<Cpu> listCpu = cdb.getAll();
        List<Ram> listRam = rdb.getAll();
        List<Laptop> list = ldb.getAll();
        List<Manufacturer> listManu = mdb.getAll();

        boolean chid[] = new boolean[listManu.size() + 1];
        chid[0] = true;
        /////////////  filter laptop by taskbar  
        String manuId_raw = request.getParameter("manuId");  // get manufacturerId on taskbar
        int manuId = 0;                          /// set it to 0 to get All
        if (manuId_raw != null) {               /// parse it to integer and getLaptop by it Id 
            manuId = Integer.parseInt(manuId_raw);
            list = ldb.getLaptopByManufacturerId(manuId);
            if (manuId == 0) {
                chid[0] = true;                     ///   tick to check box "Alll"  
            }
        }

        ////////////////////   end filter laptop by taskbar
        int page, numOfProduct = 9;
        String key = request.getParameter("key");            ///////// get infor from search

        /////        this is paging process
        List<Laptop> listSearch = ldb.searchByName(key);
        int size = 0;
        if (key != null) {
            size = listSearch.size();        ///// there are two list so we must have two case
        } else {
            size = list.size();
        }
        int numOfPage = (size % 9 == 0 ? (size / 9) : (size / 9) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numOfProduct;
        end = Math.min(page * numOfProduct, size);
        List<Laptop> listP = new ArrayList<>();
        if (key != null) {
            listP = ldb.getListByPage(listSearch, start, end);  ///// there are two list so we must have two case
        } else {
            listP = ldb.getListByPage(list, start, end);
        }
        //// Laptop want to show will get in here

        /////////////////////  end paging process
        ////////////////////  stock process
        request.setAttribute("listSsd", listSsd);
        request.setAttribute("listScreen", listScreen);
        request.setAttribute("listCpu", listCpu);
        request.setAttribute("listRam", listRam);
        request.setAttribute("manuId", manuId);
        request.setAttribute("data", listP);
        request.setAttribute("page", page);
        request.setAttribute("num", numOfPage);
        request.setAttribute("key", key);
        request.setAttribute("manufacturer", listManu);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

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
