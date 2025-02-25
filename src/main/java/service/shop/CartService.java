package service.shop;

import model.shop.Cart;
import java.util.List;

public interface CartService {
    int addCart(Cart cart);
    List<Cart> findAllCarts();
    int updateCart(Cart cart);
    int deleteCart(int cartId);
}
