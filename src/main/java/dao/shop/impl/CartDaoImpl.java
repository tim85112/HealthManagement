package dao.shop.impl;

import dao.shop.BaseDao;
import dao.shop.CartDao;
import model.shop.Cart;
import java.util.List;

public class CartDaoImpl extends BaseDao implements CartDao {

    @Override
    public int addCart(Cart cart) {
        String sql = "INSERT INTO cart (user_id, product_id, quantity, created_at) VALUES (?, ?, ?, ?)";
        return baseUpdate(sql, cart.getUserId(), cart.getProductId(), cart.getQuantity(), cart.getCreatedAt());
    }

    @Override
    public List<Cart> findAllCarts() {
        String sql = "SELECT cart_id as cartId, user_id as userId, product_id as productId, quantity, created_at as createdAt FROM cart";
        return baseQuery(Cart.class, sql);
    }

    @Override
    public int updateCart(Cart cart) {
        String sql = "UPDATE cart SET user_id=?, product_id=?, quantity=?, created_at=? WHERE cart_id=?";
        return baseUpdate(sql, cart.getUserId(), cart.getProductId(), cart.getQuantity(), cart.getCreatedAt(), cart.getCartId());
    }

    @Override
    public int deleteCart(int cartId) {
        String sql = "DELETE FROM cart WHERE cart_id=?";
        return baseUpdate(sql, cartId);
    }
}
