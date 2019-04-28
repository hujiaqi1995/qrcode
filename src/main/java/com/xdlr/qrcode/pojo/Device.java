package com.xdlr.qrcode.pojo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.xdlr.qrcode.util.GlobalVariable;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "device")
@Entity
@NoArgsConstructor
@Data
public class Device {
    @Id
    //设备编号
    private String id;
    // 设备名称
    private String deviceName;
    //二维码页面链接
    private String qrcodePageLink;
    //购置日期
    private Date date;
    //购置价格
    private Double price;
    //存放地址
    private String address;
    // 责任人
    private String principal;
    // 资产类别
    private String category;

    public Device(String id, String deviceName, Date date, Double price, String address, String principal, String category) {
        this.id = id;
        this.deviceName = deviceName;
        this.qrcodePageLink = GlobalVariable.QR_CODE_PATH + id;
        this.date = date;
        this.price = price;
        this.address = address;
        this.principal = principal;
        this.category = category;
    }
}
