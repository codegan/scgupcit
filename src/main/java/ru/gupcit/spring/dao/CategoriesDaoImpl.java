package ru.gupcit.spring.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import ru.gupcit.spring.model.Applications;
import ru.gupcit.spring.model.Categoryes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by zaur on 16.01.17.
 */
public class CategoriesDaoImpl {

    JdbcTemplate jdbcTemplate;
    public void setTemplate(JdbcTemplate template) {
        this.jdbcTemplate = template;
    }
    public List<Categoryes> getAllCategoryes(){
        String sql = "SELECT scgupcit.categories.id id, scgupcit.categories.name name FROM scgupcit.categories";
        return  jdbcTemplate.query(sql,
                new RowMapper<Categoryes>() {
                    public Categoryes mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Categoryes categoryes = new Categoryes();
                        categoryes.setId(rs.getInt("id"));
                        categoryes.setName(rs.getString("name"));
                        return categoryes;
                    }
                });
    }
}
