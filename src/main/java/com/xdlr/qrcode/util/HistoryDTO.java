package com.xdlr.qrcode.util;

import com.xdlr.qrcode.pojo.History;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HistoryDTO {
    private String id;
    private String deviceId;
    private String date;
    private String price;
    private String note;

    public static HistoryDTO history2DTO(History history) {
        HistoryDTO dto = new HistoryDTO(String.valueOf(history.getId()),
                history.getDeviceId(),
                String.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(history.getDate())),
                String.valueOf(history.getPrice()),
                history.getNote());
        return dto;
    }

    public static History dto2History(HistoryDTO historyDTO) throws ParseException {
        History history = new History(Integer.valueOf(historyDTO.getId()),
                historyDTO.getDeviceId(),
                new SimpleDateFormat("yyyy-MM-dd").parse(historyDTO.getDate()),
                historyDTO.getNote(),
                Double.valueOf(historyDTO.getPrice()));
                return history;
    }


}
