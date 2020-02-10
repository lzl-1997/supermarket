package com.shop.dao;

import com.shop.model.Product;
import com.shop.model.User;
import com.shop.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserDao {
    JdbcTemplate jdbcTemplate=new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * 查询总记录条数
     */
    public int findTotalCount(Map<String, String[]> condition) {
        String sql="select count(*) from user where state=0 and 1=1";
        StringBuilder sb=new StringBuilder(sql);
        //遍历map
        Set<String> keySet = condition.keySet();
        //定义参数集合
        List<Object> params=new ArrayList<Object>();
        for (String key : keySet) {
            if("currentPage".equals(key)||"count".equals(key)){
                continue;
            }

            String value = condition.get(key)[0];//只存在一个元素，直接取值
            //判断value、是否有值
            if(key!=null&&!"".equals(value)){
                sb.append(" and "+key+" like ?");
                params.add("%"+value+"%");//模糊查询
            }
        }
        Integer counts = jdbcTemplate.queryForObject(sb.toString(),Integer.class,params.toArray());
        return counts;
    }

    /**
     * 分页/条件查询
     */
    public List findByPage(int startindex, int count, Map<String, String[]> condition) {
        String sql="select * from user where state=0 and 1=1";
        StringBuilder sb=new StringBuilder(sql);
        //遍历map
        Set<String> keySet = condition.keySet();
        //定义参数集合
        List<Object> params=new ArrayList<Object>();
        for (String key : keySet) {
            if("currentPage".equals(key)||"count".equals(key)){
                continue;
            }

            String value = condition.get(key)[0];//只存在一个元素，直接取值
            //判断value、是否有值
            if(key!=null&&!"".equals(value)){
                sb.append(" and "+key+" like ?");
                params.add("%"+value+"%");//模糊查询
            }
        }
        sb.append(" limit ?,?");
        params.add(startindex);
        params.add(count);
        List<User> list = jdbcTemplate.query(sb.toString(),new BeanPropertyRowMapper<User>(User.class),params.toArray());
        return list;
    }
}
