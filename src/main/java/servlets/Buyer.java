package servlets;

import db.DBOrders;
import db.DBProducts;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.Order;
import logic.Product;

public class Buyer extends HttpServlet {

    private Order order;
    private DBOrders daoOrders = new DBOrders();
    private DBProducts daoProducts = new DBProducts();

    private void setOrder(int id, String name, String creditCardNumber, int creditCardCode, String status) {
        order = new Order();
        order.setId(id);
        order.setBuyer(name);
        order.setCreditCardNumber(creditCardNumber);
        order.setCreditCardCode(creditCardCode);
        order.setStatus(status);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Buyer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Buyer at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        request.setAttribute("orderId", orderId);

        RequestDispatcher view = request.getRequestDispatcher("views/buyer.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String name = request.getParameter("name");
        String creditCardNumber = request.getParameter("creditCardNumber");
        int creditCardCode = Integer.parseInt(request.getParameter("creditCardCode"));

        this.setOrder(orderId, name, creditCardNumber, creditCardCode, "Pagada");
        
        /**Actualiza y completa la orden**/
        DBOrders daoOrders = new DBOrders();
        daoOrders.update(order);
        order = daoOrders.selectById(orderId);
        
        /**Descuenta del stock la cantidad comprada**/
        DBProducts daoProducts = new DBProducts();
        daoProducts.update(order.getProductId(), order.getQuantity());

        RequestDispatcher view = request.getRequestDispatcher("views/response.jsp");
        view.forward(request, response);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
