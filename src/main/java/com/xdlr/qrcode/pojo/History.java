package com.xdlr.qrcode.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "history")
@NoArgsConstructor
@Data
@AllArgsConstructor
public class History {
    @Id
    @GeneratedValue
    private Integer id;
    private String deviceId;
    private Date date;
    private String note;
    private double price;

    public History(String deviceId, Date date, String note, double price) {
        this.deviceId = deviceId;
        this.date = date;
        this.note = note;
        this.price = price;
    }
}
