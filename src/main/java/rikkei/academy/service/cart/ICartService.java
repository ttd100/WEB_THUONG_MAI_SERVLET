package rikkei.academy.service.cart;

import rikkei.academy.model.Cart;
import rikkei.academy.model.CartStatus;
import rikkei.academy.model.Product;
import rikkei.academy.service.IGenericService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

public interface ICartService extends IGenericService<Cart> {
    List<Cart> findCartByUSerId(int idUser, CartStatus status) throws SQLException;

    List<Product> findProductsByCartId(int idCart) throws SQLException;

    Cart save(int idUser) throws SQLException;

    void addProductToCart(int idCart, int idProduct, int quantity) throws SQLException;

    void removeProductFromCart(int idCart, int idProduct) throws SQLException;

    void editCartStatus(int idCart, CartStatus status) throws SQLException;

    List<Cart> findCartByStatus(CartStatus status) throws SQLException;
    void setCreatedTime(int id) throws SQLException;
    void setChangedTime(int id) throws SQLException;
}
