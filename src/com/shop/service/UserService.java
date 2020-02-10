package com.shop.service;

import javax.servlet.http.HttpServletRequest;

import com.shop.dao.ProductDao;
import com.shop.model.Admin;
import com.shop.model.User;
import com.shop.utils.JDBCUtils;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.UUID;

public class UserService {
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    //判断用户是否登录成功
    public boolean CheckUserLogin(String username, String password) {

        try {
            String sql = "select * from user where username=? and password=? and state=0";
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            System.out.println(user);
            if (user != null) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //判断管理员是否登录成功
    public boolean CheckAdminLogin(String username, String password) {

        try {
            String sql = "select * from user where username=? and password=? and state=1";
            Admin admin = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Admin>(Admin.class), username, password);
            if (admin != null) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //注册用户
    public int register(User user) {
        String sql = "insert into user values(?,?,?,?,?,?,?)";
        int count = jdbcTemplate.update(sql, UUID.randomUUID().toString(), user.getUsername(), user.getPhone(), user.getSex(), user.getPassword(), user.getEmail(), 0);
        if (count == 1) {
            return 1;
        }
        return 0;
    }

    //通过用户名判断用户是否存在
    public boolean findByUsername(String username, HttpServletRequest request) {
        String sql = "select * from user where username=?";
        User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username);
        if (user != null) {
            return true;
        }
        return false;
    }

    public boolean findByUsername(String username) {
        String sql = "select * from user where username=?";
        try {
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username);
            if (user != null) {
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }
}
