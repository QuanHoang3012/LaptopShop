/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.cpu.Cpu;
import com.model.laptop.Laptop;
import com.model.laptop.LaptopDAO;
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
        LaptopDAO laptopdao = new LaptopDAO();
        List<Screen> listScreen = WebController.getInstance().screendao.getAll();
        List<Ssd> listSsd = WebController.getInstance().ssddao.getAll();
        List<Cpu> listCpu = WebController.getInstance().cpudao.getAll();
        List<Ram> listRam = WebController.getInstance().ramdao.getAll();
        List<Manufacturer> listManu = WebController.getInstance().manudao.getAll();       
        List<Laptop> list ;
        ////////////  Get information of checkbox
        String[] manuIdBox_raw = request.getParameterValues("manuIdBox");
        String[] cpuBox_raw = request.getParameterValues("cpuBox");
        String[] screenBox_raw = request.getParameterValues("screenBox");
        String[] ramBox_raw = request.getParameterValues("ramBox");
        String[] ssdBox_raw = request.getParameterValues("ssdBox");
        String priceBox_raw = request.getParameter("priceBox");

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
        boolean checkPrice[] = new boolean[5];

        int[] cpuBox = null;
        int[] manuIdBox = null;
        int[] screenBox = null;
        int[] ramBox = null;
        int[] ssdBox = null;
        int priceBox = 0;
        try {
            priceBox = Integer.parseInt(priceBox_raw);
        } catch (NumberFormatException e) {
        }
        int manuId = 0;                          /// set it to 0 to get All

        //////////    Default option =1 to get ascesding price
        int option = 1;
        String href = "";
        /////////      Option 1 to get ascesing and option 2 to get descciding price
        if (sort != null) {
            if (sort.equals("priceAsc")) {
                option = 1;
            } else if (sort.equals("priceDes")) {
                option = 2;
            }
        }
        list = laptopdao.getAllLaptop(option);
        //////////        Check if have something to search in text to search product      
        if (key != null) {
            list = WebController.getInstance().laptopdao.searchByName(key, option);
            href += "key=" + key+"&";
        }

        /////////    Check if manuId in taskbar is not null to get Laptop by manufacturer ID
        if (manuId_raw != null) {               /// parse it to integer and getLaptop by it Id 
            manuId = Integer.parseInt(manuId_raw);
            list = WebController.getInstance().laptopdao.getLaptopByManufacturerId(manuId, option);
            if (manuId == 0) {
                checkManu[0] = true;                     ///   tick to check box "Alll"  
            }
            href = "manuId=" + manuId+"&";
        }

        //////////  Check checkbox is active or not to search product by checkbox
        manuIdBox = parseToInt(manuIdBox_raw, manuIdBox);
        cpuBox = parseToInt(cpuBox_raw, cpuBox);
        ramBox = parseToInt(ramBox_raw, ramBox);
        ssdBox = parseToInt(ssdBox_raw, ssdBox);
        screenBox = parseToInt(screenBox_raw, screenBox);

        /////  Case of price
        int from = 0, last = 0;
        switch (priceBox) {
            case 1:
                from = 10000000;
                last = 15000000;
                break;

            case 2:
                from = 15000000;
                last = 20000000;
                break;
            case 3:
                from = 20000000;
                last = 25000000;
                break;
            case 4:
                from = 25000000;
                last = 0;
                break;
        }
        if (manuIdBox_raw != null || cpuBox_raw != null || screenBox_raw != null || ssdBox_raw != null || ramBox_raw != null) {
            list = WebController.getInstance().laptopdao.searchByCheck(manuIdBox, screenBox, ramBox, cpuBox, ssdBox, from, last, option);
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
        if (priceBox == 0) {
            checkPrice[0] = true;
        }

        ///////////  set tick to checkbox that be selected
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

        if (priceBox != 0) {
            checkPrice[priceBox] = true;
        }

        checkCpu = checkBox(cpuBox_raw, cpuBox, checkCpu);

        checkRam = checkBox(ramBox_raw, ramBox, checkRam);

        checkScreen = checkBox(screenBox_raw, screenBox, checkScreen);

        checkSsd = checkBox(ssdBox_raw, ssdBox, checkSsd);
        
        if(manuIdBox_raw!= null) {
            for(int i=0;i<manuIdBox.length;i++){
                href+= "manuIdBox="+manuIdBox[i]+"&";               
            }
        }
           if(ramBox_raw!= null) {
            for(int i=0;i<ramBox.length;i++){
                href+= "ramBox="+ramBox[i]+"&";               
            }
           }
            if(priceBox_raw!=null){
                href+="priceBox="+priceBox+"&";
            }
        
           if(cpuBox_raw!= null) {
            for(int i=0;i<cpuBox.length;i++){
                href+= "cpuBox="+cpuBox[i]+"&";               
            }
           }
            if(ssdBox_raw!= null) {
            for(int i=0;i<ssdBox.length;i++){
                href+= "ssdBox="+ssdBox[i]+"&";               
            }
            }
            if(screenBox_raw!= null) {
            for(int i=0;i<screenBox.length;i++){
                href+= "screenBox="+screenBox[i]+"&";               
            }
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

        request.setAttribute("href", href);
        request.setAttribute("checkSsd", checkSsd);
        request.setAttribute("checkRam", checkRam);
        request.setAttribute("checkScreen", checkScreen);
        request.setAttribute("checkCpu", checkCpu);
        request.setAttribute("checkManu", checkManu);
        request.setAttribute("checkPrice", checkPrice);
        request.setAttribute("sort", sort);      
        request.setAttribute("manuId", manuId);
        request.setAttribute("data", listP);
        request.setAttribute("page", page);
        request.setAttribute("num", numOfPage);
        request.setAttribute("key", key);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

    }

    private int[] parseToInt(String[] box_raw, int[] box) {
        if (box_raw != null) {
            box = new int[box_raw.length];
            for (int i = 0; i < box.length; i++) {
                box[i] = Integer.parseInt(box_raw[i]);
            }
        }
        return box; 
    }

    private boolean[] checkBox(String[] boxRaw, int[] box, boolean[] check) {
        if (boxRaw != null && box[0] != 0) {
            check[0] = false;
            for (int i = 1; i < check.length; i++) {
                if (isCheck(i, box)) {
                    check[i] = true;
                } else {
                    check[i] = false;
                }
            }
        } else if (boxRaw != null && box[0] == 0) {
            check[0] = true;
        }
        return check;
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
