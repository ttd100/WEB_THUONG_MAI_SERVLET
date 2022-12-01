package rikkei.academy.service.user;

import rikkei.academy.config.ConnectMySQL;
import rikkei.academy.model.Role;
import rikkei.academy.model.User;
import rikkei.academy.service.role.IRoleService;
import rikkei.academy.service.role.RoleServiceIMPL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServiceIMPL implements IUserService {
    private Connection connection = ConnectMySQL.getConnection();
    private IRoleService roleService = new RoleServiceIMPL();
    private String LIST_USER = "select id,name,username,email,password,status,avatar from user";
    private String INSERT_USER = "insert into user(name,username,email,password) values (?,?,?,?)";
    private String FIND_ID = "select name,username,email,password,status,avatar from user where id = ?";
    private String REMOVE = "delete from user where id = ?";
    private String UPDATE_USER = "update user set name = ?, username = ?, email = ?, password = ?, status = ?, avatar = ? where id = ?";
    private String CHECK_LOGIN = "select id,name,email,avatar from user where username = ? and password = ?";
    private String CHECK_USERNAME = "select id from user where username = ?";
    private String CHECK_EMAIL = "select id from user where email = ?";
    private String CHECK_PASSWORD = "select password from user where id = ?";


    @Override
    public List<User> findAll() throws SQLException {
        List<User> userList = new ArrayList<>();
        try (
                PreparedStatement ps = connection.prepareStatement(LIST_USER);
        ) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");
                Role role = roleService.findByUserId(id);
                userList.add(new User(id, name, username, email, password, avatar, status, role));
            }
        }
        return userList;
    }

    @Override
    public void save(User user) throws SQLException {
        try (
                PreparedStatement ps_insert = connection.prepareStatement(INSERT_USER, Statement.RETURN_GENERATED_KEYS);
                PreparedStatement ps_update = connection.prepareStatement(UPDATE_USER)
        ) {
            if (findById(user.getId()) != null) {

                ps_update.setString(1, user.getName());
                ps_update.setString(2, user.getUsername());
                ps_update.setString(3, user.getEmail());
                ps_update.setString(4, user.getPassword());
                ps_update.setBoolean(5, user.isStatus());
                ps_update.setString(6, user.getAvatar());
                ps_update.setInt(7, user.getId());

                ps_update.executeUpdate();

            } else {

                ps_insert.setString(1, user.getName());
                ps_insert.setString(2, user.getUsername());
                ps_insert.setString(3, user.getEmail().trim().isEmpty() ? null : user.getEmail());
                ps_insert.setString(4, user.getPassword());
                ps_insert.executeUpdate();
                ResultSet rs = ps_insert.getGeneratedKeys();
                int id_user = 0;
                if (rs.next()) {
                    id_user = rs.getInt(1);
                }
                roleService.saveRoleUser(id_user, user.getRole().getId());
            }
        }
    }

    @Override
    public User findById(int id) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(FIND_ID);
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");
                Role role = roleService.findByUserId(id);

                return new User(id, name, username, email, password, avatar, status, role);
            }
        }
        return null;
    }

    @Override
    public void deleteById(int id) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(REMOVE)
        ) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    @Override
    public User checkLogin(String username, String password) throws SQLException {
        User user = null;
        try (
                PreparedStatement ps = connection.prepareStatement(CHECK_LOGIN);
        ) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String avatar = rs.getString(4);
                Role role = roleService.findByUserId(id);
                user = new User();
                user.setId(id);
                user.setName(name);
                user.setEmail(email);
                user.setAvatar(avatar);
                user.setUsername(username);
                user.setPassword(password);
                user.setRole(role);
            }
        }
        return user;
    }

    @Override
    public boolean existsByUsername(String username) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(CHECK_USERNAME)
        ) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean existsByEmail(String username) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(CHECK_EMAIL)
        ) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        }
        return false;
    }
}
