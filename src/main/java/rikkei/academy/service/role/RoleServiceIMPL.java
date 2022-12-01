package rikkei.academy.service.role;

import rikkei.academy.config.ConnectMySQL;
import rikkei.academy.model.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleServiceIMPL implements IRoleService {

    private Connection connection = ConnectMySQL.getConnection();
    private String FIND_NAME = "select id from role where name = ?";
    private String FIND_BY_USER_ID = "select id, name from role r join userrole ur on r.id = ur.idrole where ur.iduser = ?";
    private String INSERT_ROLE_USER = "insert into userrole(iduser,idrole) values(?, ?)";

    public Role findByName(String name) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(FIND_NAME)
        ) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                return new Role(id, name);
            }
        }
        return null;
    }

    public Role findByUserId(int idUser) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(FIND_BY_USER_ID);
        ) {
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                return new Role(id, name);
            }
        }
        return null;
    }

    @Override
    public void saveRoleUser(int idUser, int idRole) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(INSERT_ROLE_USER);
        ) {
            ps.setInt(1, idUser);
            ps.setInt(2, idRole);
            ps.executeUpdate();
        }
    }

}
