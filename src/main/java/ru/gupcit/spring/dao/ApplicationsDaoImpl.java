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
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String sql = "SELECT scgupcit.users.username name, scgupcit.organizations.name orgname, scgupcit.categories.name cgname, scgupcit.system.name stname, scgupcit.applications.id id, scgupcit.applications.text text FROM "+
                "scgupcit.users   INNER JOIN scgupcit.applications on (scgupcit.users.id=scgupcit.applications.id_user)"+
                "INNER JOIN scgupcit.organizations on (scgupcit.organizations.id = scgupcit.users.id_organization)"+
                "INNER JOIN scgupcit.categories on (scgupcit.categories.id = scgupcit.applications.id_categories)"+
                "INNER JOIN scgupcit.system on (scgupcit.system.id = scgupcit.applications.id_system)";
        return  jdbcTemplate.query(sql,
                new RowMapper<Applications>() {
                    public Applications mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Applications app = new Applications();
                        app.setId(rs.getInt("id"));
                        app.setAuthor(rs.getString("name"));
                        app.setOrganizations(rs.getString("orgname"));
                        app.setCategory(rs.getString("cgname"));
                        app.setSystem(rs.getString("stname"));
                        app.setText(rs.getString("text"));
                        return app;
                    }
                });

    }
    public List<Applications> getApplicationsFromUser(){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String sql = "SELECT scgupcit.categories.name cgname, scgupcit.system.name stname, scgupcit.applications.id id, scgupcit.applications.text text FROM "+
                "scgupcit.users INNER JOIN scgupcit.applications on (scgupcit.users.id=scgupcit.applications.id_user)"+
                "INNER JOIN scgupcit.categories on (scgupcit.categories.id = scgupcit.applications.id_categories)"+
                "INNER JOIN scgupcit.system on (scgupcit.system.id = scgupcit.applications.id_system)"+
                "WHERE scgupcit.users.username = ?";

        return  jdbcTemplate.query(sql, new Object[]{userDetails.getUsername()},
                new RowMapper<Applications>() {
                    public Applications mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Applications app = new Applications();
                        app.setId(rs.getInt("id"));
                        app.setCategory(rs.getString("cgname"));
                        app.setSystem(rs.getString("stname"));
                        app.setText(rs.getString("text"));
                        return app;
                    }
                });

    }
}
