package ru.gupcit.spring.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.gupcit.spring.dao.UsersDao;
import ru.gupcit.spring.model.Users;

import java.util.List;

/**
 * Created by zaur on 23.12.16.
 */
@Service
public class UsersServiceImpl implements UsersService {

    private UsersDao usersDao;
    public void setUsersDao(UsersDao usersDao){
        this.usersDao = usersDao;
    }
    @Transactional
    public void addUsers(Users users) {
        this.usersDao.addUsers(users);
    }
    @Transactional
    public void updateUsers(Users users) {
        this.usersDao.updateUsers(users);
    }
    @Transactional
    public List<Users> listUsers() {
        return this.usersDao.listUsers();
    }
    @Transactional
    public void removeUsers(String username) {
        this.usersDao.removeUsers(username);
    }
}
