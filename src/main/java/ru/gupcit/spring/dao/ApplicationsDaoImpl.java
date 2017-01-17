package ru.gupcit.spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import ru.gupcit.spring.model.Applications;
import ru.gupcit.spring.model.Users;

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
    private UsersDao usersDao;
    public void setUsersDao(UsersDao usersDao){
        this.usersDao = usersDao;
    }

    public List<Applications> getAllApplications(){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String sql = "SELECT scgupcit.users.phone phone, scgupcit.users.lastname ln, scgupcit.users.firstname fn, scgupcit.users.patronimyc pn, scgupcit.organizations.name orgname, scgupcit.categories.name cgname, scgupcit.system.name stname, scgupcit.applications.id id, scgupcit.applications.text text FROM "+
                "scgupcit.users   INNER JOIN scgupcit.applications on (scgupcit.users.id=scgupcit.applications.id_user)"+
                "INNER JOIN scgupcit.organizations on (scgupcit.organizations.id = scgupcit.users.id_organization)"+
                "INNER JOIN scgupcit.categories on (scgupcit.categories.id = scgupcit.applications.id_categories)"+
                "INNER JOIN scgupcit.system on (scgupcit.system.id = scgupcit.applications.id_system) ORDER BY scgupcit.applications.id DESC";
        return  jdbcTemplate.query(sql,
                new RowMapper<Applications>() {
                    public Applications mapRow(ResultSet rs, int rowNum) throws SQLException {
                        String ln = rs.getString("ln");
                        char fn = rs.getString("fn").charAt(0);
                        char pn = rs.getString("pn").charAt(0);
                        String fio = ln + " " + fn + ". " + pn;
                        Applications app = new Applications();
                        app.setId(rs.getInt("id"));
                        app.setFio(fio);
                        app.setOrganizations(rs.getString("orgname"));
                        app.setCategory_name(rs.getString("cgname"));
                        app.setSystem_name(rs.getString("stname"));
                        app.setText(rs.getString("text"));
                        app.setPhone(rs.getString("phone"));
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
                "WHERE scgupcit.users.username = ?  ORDER BY scgupcit.applications.id DESC";

        return  jdbcTemplate.query(sql, new Object[]{userDetails.getUsername()},
                new RowMapper<Applications>() {
                    public Applications mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Applications app = new Applications();
                        app.setId(rs.getInt("id"));
                        app.setCategory_name(rs.getString("cgname"));
                        app.setSystem_name(rs.getString("stname"));
                        app.setText(rs.getString("text"));
                        return app;
                    }
                });

    }

    public void setApplication(Applications application) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Users users = usersDao.getUserInfo(userDetails.getUsername());
        String sql = "INSERT INTO scgupcit.applications " +
                "(id_user, id_categories, id_system, text) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, new Object[] {users.getId() ,application.getCategory_id(),application.getSystem_id(),application.getText()});
}
}