package com.xdlr.qrcode.service.impl;

import com.xdlr.qrcode.dao.HistoryDao;
import com.xdlr.qrcode.pojo.History;
import com.xdlr.qrcode.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class HistoryServiceImpl implements HistoryService {
    @Autowired
    private HistoryDao historyDao;

    @Override
    public Page<History> findAll(Pageable pageable) {
        return historyDao.findAll(pageable);
    }

    @Override
    public Page<History> findByDeviceId(String deviceId, Pageable pageable) {
        return historyDao.findByDeviceId(deviceId, pageable);
    }

    @Override
    public void deleteHistory(Integer historyId) {
        Optional<History> opt = historyDao.findById(historyId);
        if (opt.isPresent()) {
            historyDao.delete(opt.get());
        }
    }

    @Override
    public void add(History history) {
        historyDao.save(history);
    }

    @Override
    public History findById(Integer historyId) {
        Optional<History> opt = historyDao.findById(historyId);
        if (opt.isPresent()) {
            return opt.get();
        }
        return null;
    }
}
