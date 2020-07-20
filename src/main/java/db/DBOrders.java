package db;

import java.sql.*;
import java.util.ArrayList;
import logic.Order;

public class DBOrders {

    DBConnection cn = new DBConnection();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Order order = new Order();

    public Order selectById(int id) {

        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE orders_id='" + id + "' LIMIT 1;";
        System.out.println(sql);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                order.setId(rs.getInt("orders_id"));
                order.setTimestamp(rs.getString("orders_timestamp"));
                order.setProductId(rs.getInt("orders_product_id"));
                order.setQuantity(rs.getInt("orders_quantity"));
                order.setValue(rs.getInt("orders_value"));
                order.setBuyer(rs.getString("orders_buyer"));
                order.setCreditCardNumber(rs.getString("orders_credit_card_number"));
                order.setCreditCardCode(rs.getInt("orders_credit_card_code"));
                order.setStatus(rs.getString("orders_status"));

            }
        } catch (Exception e) {
            System.err.println("Error " + e);
        }
        return order;
    }

    public int insert(Order order) {
        int last_id = 0;
        try {
            con = cn.getConnection();

            String sql = "INSERT INTO orders "
                    + "(orders_product_id, orders_quantity, orders_value) "
                    + "VALUES (?, ?, ?);";

            ps = con.prepareStatement(sql);
            ps.setInt(1, order.getProductId());
            ps.setInt(2, order.getQuantity());
            ps.setInt(3, order.getValue());

            ps.executeUpdate();

            ps = con.prepareStatement("SELECT LAST_INSERT_ID()");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                last_id = rs.getInt("last_insert_id()");
            }

        } catch (Exception e) {
            System.err.println("Error " + e);
        }
        return last_id;
    }

    public void update(Order order) {
        try {
            con = cn.getConnection();

            String sql = "UPDATE orders "
                    + "SET "
                    + "orders_buyer = ?, "
                    + "orders_credit_card_number = ?, "
                    + "orders_credit_card_code = ?, "
                    + "orders_status = ? "
                    + "WHERE orders_id = ?;";

            ps = con.prepareStatement(sql);
            ps.setString(1, order.getBuyer());
            ps.setString(2, order.getCreditCardNumber());
            ps.setInt(3, order.getCreditCardCode());
            ps.setString(4, order.getStatus());
            ps.setInt(5, order.getId());
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error " + e);
        }
    }

    public void cancel(int id) {
        try {
            con = cn.getConnection();

            String sql = "UPDATE orders "
                    + "SET "
                    + "orders_status = 'Cancelada' "
                    + "WHERE orders_id = ?;";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error " + e);
        }
    }
}
