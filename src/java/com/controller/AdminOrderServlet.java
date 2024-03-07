/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.order.Order;
import com.model.order.OrderDetail;
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
public class AdminOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminOrderServlet at " + request.getContextPath() + "</h1>");
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
        List<Order> listOrder = WebController.getInstance().orderdao.getAllOrder();
        List<OrderDetail>[] orderDetailList = new List[listOrder.size()];
        String action = request.getParameter("action");
        String orderId = request.getParameter("id");
        for (int i = 0; i < listOrder.size(); i++) {
            orderDetailList[i] = WebController.getInstance().orderdetaildao.getOrderDetailByOrderId(listOrder.get(i).getId());
        }
        if (action != null) {
            if (action.equals("ship")) {
                WebController.getInstance().orderdao.updateStatusOrderByOrderId(Integer.parseInt(orderId), "Đang vận chuyển");
                String message = 
                         " Xác nhận đơn hàng\n"
                        + "  Xin chào bạn,\n"
                        + "  Chúng tôi xin được thông báo rằng đơn hàng của bạn đã xác nhận thành công và đang được vận chuyển.\n"
                        + "  Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi qua fb.com/hoangquanjmg hoặc gọi cho chúng tôi theo số +866 031 027\n"
                        + "  Cảm ơn bạn đã ủng hộ shop. Sự ủng hộ của bạn là động lực để chúng tôi ngày một hoàn thiện hơn.\n"
                        + "  Chúc bạn một ngày tốt lành!\n";            
                SendMail s = new SendMail();
                s.sendMail(WebController.getInstance().accountdao.getAccountById(WebController.getInstance().orderdao.getAccountByOrder(Integer.parseInt(orderId))).getEmail(), "Thông báo xác nhận đặt hàng thành công!", message, "quanhahe186591@fpt.edu.vn", "klvp ulsd hbqk jvdk");
            } else if (action.equals("cancel")) {
                WebController.getInstance().orderdao.updateStatusOrderByOrderId(Integer.parseInt(orderId), "Đã hủy");
            }
            listOrder = WebController.getInstance().orderdao.getAllOrder();
        }

        int size = listOrder.size();
        int page, numOfProduct = 12;
        int numOfPage = (size % 12 == 0 ? (size / 12) : (size / 12) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numOfProduct;
        end = Math.min(page * numOfProduct, size);
        List<Order> listP = WebController.getInstance().orderdao.getListByPage(listOrder, start, end);
        request.setAttribute("page", page);
        request.setAttribute("data", listP);
        request.setAttribute("num", numOfPage);
        request.setAttribute("orderList", listOrder);
        request.setAttribute("orderdetailList", orderDetailList);
        request.getRequestDispatcher("admin_order.jsp").forward(request, response);
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
