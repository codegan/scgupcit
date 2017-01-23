package ru.gupcit.spring.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import ru.gupcit.spring.model.Categoryes;
import ru.gupcit.spring.model.Systems;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by zaur on 16.01.17.
 */
public class SystemsDaoImpl implements ISystemsDao{
    JdbcTemplate jdbcTemplate;
    public void setTemplate(JdbcTemplate template) {
        this.jdbcTemplate = template;
    }
    public List<Systems> getAllSystemses(){
        String sql = "SELECT scgupcit.system.id id, scgupcit.system.name name FROM scgupcit.system";
        return  jdbcTemplate.query(sql,
                new RowMapper<Systems>() {
                    public Systems mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Systems systems = new Systems();
                        systems.setId(rs.getInt("id"));
                        systems.setName(rs.getString("name"));
                        return systems;
                    }
                });
    }
}
