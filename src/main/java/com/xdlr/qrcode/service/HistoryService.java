package com.xdlr.qrcode.service;

import com.xdlr.qrcode.pojo.History;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface HistoryService {
    Page<History> findAll(Pageable pageable);

    Page<History> findByDeviceId(String deviceId, Pageable pageable);

    void deleteHistory(Integer historyId);

    void add(History history);

    History findById(Integer historyId);
}
