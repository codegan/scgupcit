package ru.gupcit.spring.service;

/**
 * Created by zaur on 10.01.17.
 */
import java.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.gupcit.spring.dao.UsersDao;
import ru.gupcit.spring.model.Users;

@Service
public class AuthenticationService implements UserDetailsService {

    private UsersDao usersDao;
    public void setUsersDao(UsersDao usersDao){
        this.usersDao = usersDao;
    }
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        Users users = usersDao.getUserInfo(username);
        GrantedAuthority authority = new SimpleGrantedAuthority(users.getRole());
        UserDetails userDetails = (UserDetails)new User(users.getUsername(),
                users.getPassword(), Arrays.asList(authority));
        return userDetails;
    }
}
