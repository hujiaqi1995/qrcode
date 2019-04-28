package com.xdlr.qrcode.service.impl;

import com.xdlr.qrcode.dao.UserDao;
import com.xdlr.qrcode.pojo.User;
import com.xdlr.qrcode.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User findOne(String userName) {
        User user = userDao.findByUserName(userName);
        return user;
    }

    @Override
    public void add(String userName, String password) {
        User user = userDao.findByUserName(userName);
        if (user == null) {
            user = new User(userName, password);
            userDao.save(user);
        }
    }

    @Override
    public void delete(String userName, String password) {
        User user = userDao.findByUserName(userName);
        if (user != null && user.getPassword().equals(password)) {
            userDao.delete(user);
        }
    }

    @Override
    public void changePassword(String userName, String oldPassword, String newPassword) {
        User user = userDao.findByUserName(userName);
        if (user != null && user.getPassword().equals(oldPassword)) {
            user.setPassword(newPassword);
            userDao.save(user);
        }
    }

    @Override
    public Page<User> findAll(Pageable pageable) {
        Page<User> userPage = userDao.findAll(pageable);
        return userPage;
    }

    @Override
    public boolean login(String userName, String password) {
        User user = userDao.findByUserName(userName);
        if (user != null && user.getPassword().equals(password)) {
            return true;
        }
        return false;
    }
}
