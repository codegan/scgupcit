package ru.gupcit.spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import ru.gupcit.spring.model.Applications;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zaur on 09.01.17.
 */
public class ApplicationsDaoImpl implements ApplicationsDao{

    JdbcTemplate jdbcTemplate;
    public void setTemplate(JdbcTemplate template) {
        this.jdbcTemplate = template;
    }

    public List<Applications> getAllApplications(){

        return jdbcTemplate.query("select * from scgupcittest.applications ORDER BY id DESC",new RowMapper<Applications>(){
            public Applications mapRow(ResultSet rs, int row) throws SQLException {
                Applications applications = new Applications();
                applications.setId(rs.getInt(1));
                applications.setAuthor(rs.getString(2));
                applications.setCategory(rs.getString(3));
                applications.setSystem(rs.getString(4));
                applications.setText(rs.getString(5));
                return applications;
            }
        });
    }
}
