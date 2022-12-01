package rikkei.academy.service.role;

import rikkei.academy.model.Role;

import java.sql.SQLException;

public interface IRoleService {
    Role findByName(String name) throws SQLException;

    Role findByUserId(int idUser) throws SQLException;

    void saveRoleUser(int idUser, int idRole) throws SQLException;
}
