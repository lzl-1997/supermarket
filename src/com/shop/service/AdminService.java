package com.shop.service;

import com.shop.dao.ProductDao;
import com.shop.dao.UserDao;
import com.shop.model.PageBean;
import com.shop.model.Product;
import com.shop.model.User;
import com.shop.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.*;

public class AdminService {
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    ProductDao productDao = new ProductDao();
    UserDao userDao = new UserDao();

    //添加商品
    public int addProduct(Product product) {
        String sql = "insert into product values(?,?,?,?,?,?)";
        //设置图片随机角标
        Random random = new Random();
        int num = random.nextInt(49) + 1;
        int count = jdbcTemplate.update(sql, UUID.randomUUID().toString(), product.getPname(), "img/c_00" + num + ".jpg", product.getPrice(), product.getCount(), product.getKind());
        if (count == 1) {
            return 1;
        }
        return 0;
    }

    //查找商品
    public Product findProduct(String pid) {
        try {
            String sql = "select * from product where pid=?";
            Product product = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Product>(Product.class), pid);
            return product;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //删除商品
    public void deleteProduct(String pid) {
        String sql = "delete from product where pid=?";
        jdbcTemplate.update(sql, pid);
    }

    //删除选中商品
    public void deleteSelected(String[] pids) {
        for (String pid : pids) {
            //遍历调用delete()
            deleteProduct(pid);
        }
    }

    //更新商品
    public void updateProduct(Product product) {
        String sql = "update product set price=?,count=?,kind=? where pid=?";
        jdbcTemplate.update(sql, product.getPrice(), product.getCount(), product.getKind(), product.getPid());
        System.out.println(sql);
    }

    //分页查询商品
    public PageBean findProductByPage(String currentPage, String count, Map<String, String[]> condition) {

        /**
         * currentPage     i1
         * count           i2
         */
        int i1 = Integer.parseInt(currentPage);
        int i2 = Integer.parseInt(count);
        if (i1 < 1) {
            i1 = 1;
        }

        //创建对象并设置参数
        PageBean pageBean = new PageBean();


        //查询总记录数
        int totalCount = productDao.findTotalCount(condition);
        pageBean.setTotalCount(totalCount);
        //封装每页的数据到集合
        int startindex = (i1 - 1) * i2;
        List list = productDao.findByPage(startindex, i2, condition);
        pageBean.setList(list);
        //查询页码数
        int totalPage = totalCount % i2 == 0 ? totalCount / i2 : (totalCount / i2) + 1;
        if (i1 > totalPage) {
            i1 = totalPage;
        }
        pageBean.setCurrentPage(i1);
        pageBean.setCount(i2);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    //分页查询用户
    public PageBean findUserByPage(String currentPage, String count, Map<String, String[]> condition) {

        int i1 = Integer.parseInt(currentPage);
        int i2 = Integer.parseInt(count);
        if (i1 < 1) {
            i1 = 1;
        }

        //创建对象并设置参数
        PageBean pageBean = new PageBean();


        //查询总记录数
        int totalCount = userDao.findTotalCount(condition);
        pageBean.setTotalCount(totalCount);
        //封装每页的数据到集合
        int startindex = (i1 - 1) * i2;
        List list = userDao.findByPage(startindex, i2, condition);
        pageBean.setList(list);
        //查询页码数
        int totalPage = totalCount % i2 == 0 ? totalCount / i2 : (totalCount / i2) + 1;
        if (i1 > totalPage) {
            i1 = totalPage;
        }
        pageBean.setCurrentPage(i1);
        pageBean.setCount(i2);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    //通过ID查找用户
    public User findUser(String id) {
        try {
            String sql = "select * from user where id=?";
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
            if (user != null) {
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //更新用户
    public void updateUser(User user) {
        String sql = "update user set username=?,phone=?,sex=?,password=?,email=? where id=?";
        jdbcTemplate.update(sql, user.getUsername(), user.getPhone(), user.getSex(), user.getPassword(), user.getEmail(), user.getId());
    }

    //添加用户
    public int addUser(User user) {
        String sql = "insert into user values(?,?,?,?,?,?,?)";
        int count = jdbcTemplate.update(sql, UUID.randomUUID().toString(), user.getUsername(), user.getPhone(), user.getSex(), user.getPassword(), user.getEmail(), 0);
        return count;
    }

    //通过ID删除用户
    public void deleteUser(String id) {
        String sql = "delete from user where id=?";
        jdbcTemplate.update(sql, id);
    }

    //删除选中
    public void deleteSelectedUser(String[] ids) {
        for (String id : ids) {
            //遍历调用delete()
            deleteUser(id);
        }
    }

    //查询所有商品
    public List<Product> findAll() {
        String sql = "select * from product";
        List<Product> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
        return list;
    }

    //通过商品名查询
    public Product findProductByName(String pname) {
        Product product = null;
        try {
            String sql = "select * from product where pname=?";
            product = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Product>(Product.class), pname);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return product;
    }
    public List<Product> findProductsByName(String pname) {
        List<Product> list = null;
        try {
            String sql = "select * from product where pname like ?";
            list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class), "%" + pname + "%");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }

    //通过商品种类查询
    public List<Product> findProductBykind(String kind) {
        List<Product> List = new ArrayList<Product>();
        try {
            String sql = "select * from product where kind=?";
            List<Product> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class), kind);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

