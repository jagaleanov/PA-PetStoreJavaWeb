/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.DBOrders;
import db.DBProducts;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.Order;
import logic.Product;

/**
 *
 * @author jgale
 */
@WebServlet(name = "Details", urlPatterns = {"/Details"})
public class Details extends HttpServlet {
    
    private Order order;
    private int productId;
    private int quantity;
    private int value;
    private DBOrders dao = new DBOrders();

    
    private void setOrder(int productId, int quantity, int value){
        order = new Order();
        order.setProductId(productId);
        order.setQuantity(quantity);
        order.setValue(value);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Details</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Details at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*
            AquÃ­ se hace el llamado a la clase de mysql y se reciben los datos de tipo list
         */
        DBProducts dao = new DBProducts();
        int id;
        /*
            AquÃ­ recibo el id que viene via get y lo uso para la consulta en mysql
         */
        id = Integer.parseInt(request.getParameter("id"));
        Product product = (Product) dao.selectById(id);

        /*
            AquÃ­ monto los resultados en un atributo que se envia al archivo jsp,
        ahora envio un objeto de tipo product
         */
        request.setAttribute("product", product);

        /*
            AquÃ­ hago el llamado a la vista sin necesidad de redireccionar
         */
        RequestDispatcher view = request.getRequestDispatcher("views/details.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        productId = Integer.parseInt(request.getParameter("product_id"));
        quantity = Integer.parseInt(request.getParameter("quantity"));
        value = (Integer.parseInt(request.getParameter("price")) * Integer.parseInt(request.getParameter("quantity")));
        
        this.setOrder(productId,quantity,value);
        
        DBOrders dao = new DBOrders();
        int orderId = dao.insert(order);
        response.sendRedirect("Buyer?orderId="+orderId);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
