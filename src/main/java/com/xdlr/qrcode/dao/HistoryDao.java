package com.xdlr.qrcode.dao;

import com.xdlr.qrcode.pojo.History;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HistoryDao extends JpaRepository<History,Integer> {
    Page<History> findByDeviceId(String deviceId, Pageable pageable);
}
