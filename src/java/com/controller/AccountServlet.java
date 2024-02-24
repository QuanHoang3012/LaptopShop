/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.account.Account;
import com.model.order.Order;
import com.model.order.OrderDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Anh Quan
 */
public class AccountServlet extends HttpServlet {

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
            out.println("<title>Servlet AccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        Account account = null;
        if (session.getAttribute("account") != null) {
            account = (Account) session.getAttribute("account");
            if (action.equals("updateInfo")) {
                String fullname = request.getParameter("name");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phone");
                String birthday = request.getParameter("birthdate");
                String gender_raw = request.getParameter("gender");
                int gender = 1;
                if (gender_raw.equals("male")) {
                    gender = 1;
                } else if (gender_raw.equals("female")) {
                    gender = 0;
                } else if (gender_raw.equals("other")) {
                    gender = 2;
                }
                boolean result = WebController.getInstance().accountdao.updateAccountById(account.getId(), fullname, phoneNumber, email, gender, birthday, null);
                Account updateAccount = WebController.getInstance().accountdao.getAccountById(account.getId());
                session.setAttribute("account", updateAccount);
                if (result) {
                    request.setAttribute("updateResult", "Cập nhật thành công");
                } else {
                    request.setAttribute("updateResult", "Cập nhật không thành công");
                }
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else if (action.equals("password")) {
                String currentPassword = request.getParameter("currentPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");
                if (account.getPassword().equals(currentPassword)) {
                    if (newPassword.equals(confirmPassword) && !newPassword.isEmpty()) {
                        boolean result = WebController.getInstance().accountdao.updatePassword(account.getId(), newPassword);
                        if (result) {
                            request.setAttribute("resultChangePass", "Đổi mật khẩu thành công");
                            session.setAttribute("account", account);
                        } else {
                            request.setAttribute("resultChangePass", "Đổi mật khẩu không thành công");
                        }
                    } else {
                        request.setAttribute("resultChangePass", "Mật khẩu không trùng khớp");
                    }
                } else {
                    request.setAttribute("resultChangePass", "Sai mật khẩu");
                }
                request.getRequestDispatcher("updatepassword.jsp").forward(request, response);
            } else if (action.equals("addAddress")) {
                String name = request.getParameter("fullName");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                if (name != null || phone != null | address != null) {
                    boolean result = WebController.getInstance().addressdao.addAddres(account, name, phone, address);
                    if (result) {
                        request.setAttribute("resultAdd", "Thêm thành công");
                        request.getRequestDispatcher("addressAccount.jsp").forward(request, response);
                    } else {
                        request.setAttribute("resultAdd", "Thêm thất bại");
                    }
                }
            } else if (action.equals("deleteAddress")) {
                String addressId_raw = request.getParameter("id");
                try {
                    int addressId = Integer.parseInt(addressId_raw);
                    WebController.getInstance().addressdao.deleteAdress(addressId);
                    request.getRequestDispatcher("addressAccount.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            } else if (action.equals("order-product")) {
                String status = request.getParameter("status");
                String id_raw = request.getParameter("id");
                String alert = "";
                if(id_raw!=null && status.equals("order-pending")) {
                    int id = Integer.parseInt(id_raw);
                    boolean result = WebController.getInstance().orderdao.deleteOrderByOrderId(id);
                    if(result){
                        alert="Hủy đơn thành công";
                    }else alert = "Hủy đơn thất bại";
                }else {
                }
                 if(id_raw!=null && status.equals("order-finish")) {
                    int id = Integer.parseInt(id_raw);
                    boolean result = WebController.getInstance().orderdao.updateStatusOrderByOrderId(id, "Đã nhận hàng");
                    if(result){
                        alert="Thao tác thành công";
                    }else alert = "Thao tác thất bại";
                }else {
                }
                
                List<Order> orderCustomer = WebController.getInstance().orderdao.getOrderForCustomer(account.getId(), "Đang");
                List<OrderDetail> [] orderDetailList = new List[orderCustomer.size()];
                for(int i=0;i<orderCustomer.size();i++){
                    orderDetailList[i] = WebController.getInstance().orderdetaildao.getOrderDetailByOrderId(orderCustomer.get(i).getId());
                }
                request.setAttribute("orderList",orderCustomer );
                request.setAttribute("alert", alert);
                request.setAttribute("orderdetailList", orderDetailList);
                request.getRequestDispatcher("product_order.jsp").forward(request, response);
            }else if(action.equals("history-order")){
                List<Order> orderCustomer = WebController.getInstance().orderdao.getOrderForCustomer(account.getId(), "Đã");
                List<OrderDetail> [] orderDetailList = new List[orderCustomer.size()];
                for(int i=0;i<orderCustomer.size();i++){
                    orderDetailList[i] = WebController.getInstance().orderdetaildao.getOrderDetailByOrderId(orderCustomer.get(i).getId());
                }
                request.setAttribute("orderList",orderCustomer );
                request.setAttribute("orderdetailList", orderDetailList);
                request.getRequestDispatcher("history_order.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
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
