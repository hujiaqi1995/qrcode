package com.xdlr.qrcode.service.impl;

import com.xdlr.qrcode.dao.DeviceDao;
import com.xdlr.qrcode.pojo.Device;
import com.xdlr.qrcode.service.DeviceService;
import com.xdlr.qrcode.util.DeviceIdUtil;
import com.xdlr.qrcode.util.GlobalVariable;
import com.xdlr.qrcode.util.QrcodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Optional;

@Service
public class DeviceServiceImpl implements DeviceService {

    @Autowired
    private DeviceDao deviceDao;

    @Override
    public Page<Device> findAll(Pageable pageable) {
        return deviceDao.findAll(pageable);
    }

    @Override
    public Device findById(String deviceId) {
        Optional<Device> opt = deviceDao.findById(deviceId);
        return opt.isPresent() ? opt.get() : null;
    }

    @Override
    public Device findByName(String deviceName) {
        Optional<Device> opt = deviceDao.findByDeviceName(deviceName);
        return opt.isPresent() ? opt.get() : null;
    }

    @Override
    public void delete(String deviceId) {
        Optional<Device> opt = deviceDao.findById(deviceId);
        if (opt.isPresent()) {
            deviceDao.delete(opt.get());
        }
    }

    @Override
    @Transactional
    public void modify(String deviceId, String deviceName, Date date, double price, String address, String principal, String category) {
        Optional<Device> opt = deviceDao.findById(deviceId);
        if (opt.isPresent()) {
            delete(deviceId);
            add(deviceId, deviceName, date, price, address, principal, category);
        }
    }

    @Override
    public void add(String deviceName, Date date, double price, String address, String principal, String category) {
        String deviceId = DeviceIdUtil.generateId();
        add(deviceId, deviceName, date, price, address, principal, category);
    }

    private void add(String deviceId, String deviceName, Date date, double price, String address, String principal, String category) {
        Device device = new Device(deviceId, deviceName, date, price, address, principal, category);
        deviceDao.save(device);
        QrcodeUtil.generateQrcode(GlobalVariable.QR_CODE_PATH + deviceId, deviceId);
    }
}
