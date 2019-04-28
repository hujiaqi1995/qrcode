package com.xdlr.qrcode.service;


import com.xdlr.qrcode.pojo.Device;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Date;

public interface DeviceService {
    Page<Device> findAll(Pageable pageable);

    Device findById(String deviceId);

    Device findByName(String deviceName);

    void delete(String deviceId);

    void modify(String deviceId, String deviceName, Date date, double price, String address, String principal, String category);

    void add(String deviceName, Date date, double price, String address, String principal, String category);
}
