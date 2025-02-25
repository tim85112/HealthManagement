package service.shop;

import model.shop.Order;
import java.util.List;

/**
 * 該介面定義了orders表格為核心的業務處理功能
 */
public interface OrderService {
    /**
     * 查詢所有訂單紀錄
     * @return 返回訂單列表
     */
    List<Order> findAllOrders();
}