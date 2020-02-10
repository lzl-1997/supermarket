package com.shop.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtils {
    private static DataSource dataSource;

    static {
        try {
        Properties properties=new Properties();
            properties.load(JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties"));
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//测试是否成功
    public static void main(String[] args) throws SQLException {
        getDataSource();
    }
    //获取连接池
    public static DataSource getDataSource() {
        return dataSource;
    }
    //获取连接
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
    //释放资源
    public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
        //  5.处理结果，释放资源
        if (rs != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void close(PreparedStatement stmt,Connection conn) {
        //  释放资源（调用重载方法）
        close(null,stmt,conn);
    }
    public static void close(Connection conn) {
        //  释放资源（调用重载方法）
        close(null,null,conn);
    }
}