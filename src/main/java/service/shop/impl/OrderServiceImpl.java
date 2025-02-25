package service.shop.impl;

import dao.shop.OrderDao;
import dao.shop.impl.OrderDaoImpl;
import model.shop.Order;
import service.shop.OrderService;
import java.util.List;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao = new OrderDaoImpl();

    @Override
    public List<Order> findAllOrders() {
        return orderDao.findAllOrders();
    }
}