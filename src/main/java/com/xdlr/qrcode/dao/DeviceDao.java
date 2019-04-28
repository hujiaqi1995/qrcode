package com.xdlr.qrcode.dao;

import com.xdlr.qrcode.pojo.Device;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface DeviceDao extends JpaRepository<Device, String> {
    Optional<Device> findByDeviceName(String deviceName);
}
