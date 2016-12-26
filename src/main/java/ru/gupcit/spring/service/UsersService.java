package ru.gupcit.spring.service;

import ru.gupcit.spring.model.Users;
import java.util.List;
/**
 * Created by zaur on 23.12.16.
 */
public interface UsersService {
    public void addUsers(Users users);
    public void updateUsers(Users users);
    public List<Users> listUsers();
    public void removeUsers(String username);
}
