package ru.gupcit.spring.dao;

import org.springframework.stereotype.Repository;
import ru.gupcit.spring.model.Users;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by zaur on 23.12.16.
 */
@Repository
public class UsersDaoImpl implements UsersDao {

    private static final Logger logger = LoggerFactory.getLogger(UsersDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
    public void addUsers(Users users) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(users);
        logger.info("User saved successfully, User Details="+users);
    }

    public void updateUsers(Users users) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(users);
        logger.info("User updated successfully, Book Details="+users);
    }

    @SuppressWarnings("unchecked")
    public List<Users> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Users> usersList = session.createQuery("from Users").list();
        for(Users users : usersList){
            logger.info("Users List::"+users);
        }
        return usersList;
    }

    public void removeUsers(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        Users users = (Users) session.load(Users.class, new String(username));
        if(null != username){
            session.delete(username);
        }
        logger.info("Users deleted successfully, user details="+users);
    }
}
