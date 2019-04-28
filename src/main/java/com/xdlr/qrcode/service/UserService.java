package com.xdlr.qrcode.service;

import com.xdlr.qrcode.pojo.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface UserService {
    User findOne(String userName);

    void add(String userName, String password);

    void delete(String userName, String password);

    void changePassword(String userName, String oldPassword, String newPassword);

    Page<User> findAll(Pageable pageable);

    boolean login(String userName, String password);
}
