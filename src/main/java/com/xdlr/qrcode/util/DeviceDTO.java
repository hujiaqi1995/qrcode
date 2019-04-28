package com.xdlr.qrcode.util;

import com.xdlr.qrcode.pojo.Device;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeviceDTO {
    private String id;
    // 设备名称
    private String deviceName;
    //二维码页面链接
    private String qrcodePageLink;
    //购置日期
    private String date;
    //购置价格
    private String price;
    //存放地址
    private String address;
    // 责任人
    private String principal;
    // 资产类别
    private String category;

    public DeviceDTO(String id, String deviceName, String date, String price, String address, String principal, String category) {
        this.id = id;
        this.deviceName = deviceName;
        this.date = date;
        this.price = price;
        this.address = address;
        this.principal = principal;
        this.category = category;
    }

    public static DeviceDTO device2DeviceDTO(Device device) {
        DeviceDTO dto = new DeviceDTO();
        dto.setId(device.getId());
        dto.setDeviceName(device.getDeviceName());
        dto.setQrcodePageLink(device.getQrcodePageLink());
        dto.setDate(new SimpleDateFormat("yyyy-MM-dd").format(device.getDate()));
        dto.setAddress(device.getAddress());
        dto.setCategory(device.getCategory());
        dto.setPrincipal(device.getPrincipal());
        dto.setPrice(String.valueOf(device.getPrice()));
        return dto;
    }

    public static Device deviceDTO2Device(DeviceDTO dto) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Device device = new Device();
        try {
            device.setId(dto.getId());
            device.setDeviceName(dto.getDeviceName());
            device.setDate(format.parse(dto.getDate()));
            device.setAddress(dto.getAddress());
            device.setCategory(dto.getCategory());
            device.setPrincipal(dto.getPrincipal());
            device.setPrice(Double.valueOf(dto.getPrice()));
            device.setQrcodePageLink(GlobalVariable.QR_CODE_PATH + dto.getId());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return device;
    }

}
