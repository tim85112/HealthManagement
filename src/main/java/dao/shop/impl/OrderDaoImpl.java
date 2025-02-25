package dao.shop.impl;

import dao.shop.BaseDao;
import dao.shop.OrderDao;
import model.shop.Order;

import java.util.List;

public class OrderDaoImpl extends BaseDao implements OrderDao {
    @Override
    public int addOrder(Order order) {
        String sql = "INSERT INTO orders (user_id, total_amount, status_id, created_at) VALUES (?, ?, ?, ?)";
        int rows = baseUpdate(sql, order.getUserId(), order.getTotalAmount(), order.getStatusId(), order.getCreatedAt());
        return rows;
    }

    @Override
    public List<Order> findAllOrders() {
        String sql = "SELECT order_id as orderId, user_id as userId, total_amount as totalAmount, status_id as statusId, created_at as createdAt FROM orders";
        List<Order> ordersList = baseQuery(Order.class, sql);
        return ordersList;
    }
    @Override
    public int updateOrder(Order order) {
        String sql = "UPDATE orders SET user_id = ?, total_amount = ?, status_id = ?, created_at = ? WHERE order_id = ?";
        return baseUpdate(sql, order.getUserId(), order.getTotalAmount(), order.getStatusId(), order.getCreatedAt(), order.getOrderId());
    }

    @Override
    public int deleteOrder(int orderId) {
        String sql = "DELETE FROM orders WHERE order_id = ?";
        return baseUpdate(sql, orderId);
    }

}
