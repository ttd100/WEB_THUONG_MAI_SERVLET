package rikkei.academy.service.user;

import rikkei.academy.model.User;
import rikkei.academy.service.IGenericService;

import java.sql.SQLException;

public interface IUserService extends IGenericService<User> {
    User checkLogin(String username, String password) throws SQLException;

    boolean existsByUsername(String username) throws SQLException;
    boolean existsByEmail(String username) throws SQLException;

}
