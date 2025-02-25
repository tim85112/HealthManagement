package service.shop.impl;

import dao.shop.CartDao;
import dao.shop.impl.CartDaoImpl;
import model.shop.Cart;
import service.shop.CartService;
import java.util.List;

public class CartServiceImpl implements CartService {

    private CartDao cartDao = new CartDaoImpl();

    @Override
    public int addCart(Cart cart) {
        return cartDao.addCart(cart);
    }

    @Override
    public List<Cart> findAllCarts() {
        return cartDao.findAllCarts();
    }

    @Override
    public int updateCart(Cart cart) {
        return cartDao.updateCart(cart);
    }

    @Override
    public int deleteCart(int cartId) {
        return cartDao.deleteCart(cartId);
    }
}
