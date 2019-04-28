package com.xdlr.qrcode.dao;

import com.xdlr.qrcode.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User, Integer> {
    User findByUserName(String userName);
}
