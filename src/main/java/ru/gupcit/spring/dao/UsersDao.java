package ru.gupcit.spring.dao;

/**
 * Created by zaur on 10.01.17.
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import ru.gupcit.spring.model.Users;
public class UsersDao {

    private JdbcTemplate jdbcTemplate;
    public void setTemplate(JdbcTemplate template) {
        this.jdbcTemplate = template;
    }

    public Users getUserInfo(String username){
        String sql = "SELECT u.id id_us, u.username name, u.password pass, a.authority role ,u.lastname ln," +
                "u.firstname fn, u.patronimyc pn FROM "+
                "users u INNER JOIN authorities a on u.id=a.id_user WHERE "+
                "u.enabled =1 and u.username = ?";



        Users users = (Users)jdbcTemplate.queryForObject(sql, new Object[]{username},
                new RowMapper<Users>() {
                    public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Users user = new Users();
                        user.setId(rs.getInt("id_us"));
                        user.setUsername(rs.getString("name"));
                        user.setPassword(rs.getString("pass"));
                        user.setRole(rs.getString("role"));
                        user.setLastname(rs.getString("ln"));
                        user.setFirstname(rs.getString("fn"));
                        user.setPatronimyc(rs.getString("pn"));
                        return user;
                    }
                });
        return users;
    }
}
