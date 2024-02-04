/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.cpu.Cpu;
import com.model.laptop.Laptop;
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

        List<Screen> listScreen = WebController.getInstance().screendao.getAll();
        List<Ssd> listSsd = WebController.getInstance().ssddao.getAll();
        List<Cpu> listCpu = WebController.getInstance().cpudao.getAll();
        List<Ram> listRam = WebController.getInstance().ramdao.getAll();
        List<Laptop> list = WebController.getInstance().laptopdao.getAllLaptop();
        List<Manufacturer> listManu = WebController.getInstance().manudao.getAll();

        ////////////  Get information of checkbox
        String[] manuIdBox_raw = request.getParameterValues("manuIdBox");
        String[] cpuBox_raw = request.getParameterValues("cpuBox");
        String[] screenBox_raw = request.getParameterValues("screenBox");
        String[] ramBox_raw = request.getParameterValues("ramBox");
        String[] ssdBox_raw = request.getParameterValues("ssdBox");
        String[] priceBox_raw = request.getParameterValues("priceBox");

        ///////////  Get infor to know what type of sort
        String sort = request.getParameter("sort");
        /////////      Get infor from search
        String key = request.getParameter("key");
        // Get manufacturerId on taskbar
        String manuId_raw = request.getParameter("manuId");

        /////////  Create checkbox tick or not
        boolean checkManu[] = new boolean[listManu.size() + 1];
        boolean checkCpu[] = new boolean[listCpu.size() + 1];
        boolean checkRam[] = new boolean[listRam.size() + 1];
        boolean checkScreen[] = new boolean[listScreen.size() + 1];
        boolean checkSsd[] = new boolean[listSsd.size() + 1];
        boolean checkPrice[] = new boolean[4];

        int[] cpuBox = null;
        int[] manuIdBox = null;
        int[] screenBox = null;
        int[] ramBox = null;
        int[] ssdBox = null;
        int[] priceBox = null;
        int manuId = 0;                          /// set it to 0 to get All

        //////////    Default option =1 to get ascesding price
        int option = 1;

        /////////      Option 1 to get ascesing and option 2 to get descciding price
        if (sort != null) {
            if (sort.equals("priceAsc")) {
                option = 1;
            } else if (sort.equals("priceDes")) {
                option = 2;
            }
        }

        //////////        Check if have something to search in text to search product      
        if (key != null) {
            list = WebController.getInstance().laptopdao.searchByName(key, option);
        }

        /////////    Check if manuId in taskbar is not null to get Laptop by manufacturer ID
        if (manuId_raw != null) {               /// parse it to integer and getLaptop by it Id 
            manuId = Integer.parseInt(manuId_raw);
            list = WebController.getInstance().laptopdao.getLaptopByManufacturerId(manuId, option);
            if (manuId == 0) {
                checkManu[0] = true;                     ///   tick to check box "Alll"  
            }
        }

        //////////  Check checkbox is active or not to search product by checkbox
        if (manuIdBox_raw != null) {
            manuIdBox = new int[manuIdBox_raw.length];
            for (int i = 0; i < manuIdBox.length; i++) {
                manuIdBox[i] = Integer.parseInt(manuIdBox_raw[i]);
            }
        }
        if (cpuBox_raw != null) {
            cpuBox = new int[cpuBox_raw.length];
            for (int i = 0; i < cpuBox.length; i++) {
                cpuBox[i] = Integer.parseInt(cpuBox_raw[i]);
            }
        }
        if (ramBox_raw != null) {
            ramBox = new int[ramBox_raw.length];
            for (int i = 0; i < ramBox.length; i++) {
                ramBox[i] = Integer.parseInt(ramBox_raw[i]);
            }
        }
        if (ssdBox_raw != null) {
            ssdBox = new int[ssdBox_raw.length];
            for (int i = 0; i < ssdBox.length; i++) {
                ssdBox[i] = Integer.parseInt(ssdBox_raw[i]);
            }
        }
        if (screenBox_raw != null) {
            screenBox = new int[screenBox_raw.length];
            for (int i = 0; i < screenBox.length; i++) {
                screenBox[i] = Integer.parseInt(screenBox_raw[i]);
            }
        }

        if (manuIdBox_raw != null || cpuBox_raw != null || screenBox_raw != null || ssdBox_raw != null || ramBox_raw != null) {
            list = WebController.getInstance().laptopdao.searchByCheck(manuIdBox, screenBox, ramBox, cpuBox, ssdBox, 0, 0, option);
        }

        ////////////   Set All box to tick if not select any checkbox
        if (cpuBox_raw == null) {
            checkCpu[0] = true;
        }
        if (manuId_raw == null) {
            checkManu[0] = true;
        }
        if (ramBox_raw == null) {
            checkRam[0] = true;
        }
        if (screenBox_raw == null) {
            checkScreen[0] = true;
        }
        if (ssdBox_raw == null) {
            checkSsd[0] = true;
        }
        if (priceBox_raw == null) {
            checkPrice[0] = true;
        }

        ///////////  set check to type of product
        if (manuIdBox_raw != null && manuIdBox[0] != 0) {
            checkManu[0] = false;
            for (int i = 1; i < checkManu.length; i++) {
                if (isCheck(listManu.get(i - 1).getId(), manuIdBox)) {
                    checkManu[i] = true;
                } else {
                    checkManu[i] = false;
                }
            }
        }
        
        if (cpuBox_raw != null && cpuBox[0] != 0) {
            checkCpu[0] = false;
            for (int i = 1; i < checkCpu.length; i++) {
                if (isCheck(listCpu.get(i - 1).getId(), cpuBox)) {
                    checkCpu[i] = true;
                } else {
                    checkCpu[i] = false;
                }
            }
        } else if (cpuBox_raw != null && cpuBox[0] == 0) {
            checkCpu[0] = true;
        }
        
         if (ramBox_raw != null && ramBox[0] != 0) {
            checkRam[0] = false;
            for (int i = 1; i < checkRam.length; i++) {
                if (isCheck(listRam.get(i - 1).getId(), ramBox)) {
                    checkRam[i] = true;
                } else {
                    checkRam[i] = false;
                }
            }
        } else if (ramBox_raw != null && ramBox[0] == 0) {
            checkRam[0] = true;
        }
         
          if (screenBox_raw != null && screenBox[0] != 0) {
            checkScreen[0] = false;
            for (int i = 1; i < checkScreen.length; i++) {
                if (isCheck(listScreen.get(i - 1).getId(), screenBox)) {
                    checkScreen[i] = true;
                } else {
                    checkScreen[i] = false;
                }
            }
        } else if (screenBox_raw != null && screenBox[0] == 0) {
            checkScreen[0] = true;
        }
          
           if (ssdBox_raw != null && ssdBox[0] != 0) {
            checkSsd[0] = false;
            for (int i = 1; i < checkSsd.length; i++) {
                if (isCheck(listSsd.get(i - 1).getId(), ssdBox)) {
                    checkSsd[i] = true;
                } else {
                    checkSsd[i] = false;
                }
            }
        } else if (ssdBox_raw != null && ssdBox[0] == 0) {
            checkSsd[0] = true;
        }

        /////        this is paging process
        int size = list.size();
        int page, numOfProduct = 9;
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
        List<Laptop> listP = WebController.getInstance().laptopdao.getListByPage(list, start, end);
        /////////////////////  end paging process
        request.setAttribute("screenBox", screenBox);
        request.setAttribute("ssdBox", ssdBox);
        request.setAttribute("ramBox", ramBox);
        request.setAttribute("checkSsd", checkSsd);
        request.setAttribute("checkRam", checkRam);
        request.setAttribute("checkScreen", checkScreen);
        request.setAttribute("manuIdBox", manuIdBox);
        request.setAttribute("checkCpu", checkCpu);
        request.setAttribute("checkManu", checkManu);
        request.setAttribute("sort", sort);
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

    private boolean isCheck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
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
