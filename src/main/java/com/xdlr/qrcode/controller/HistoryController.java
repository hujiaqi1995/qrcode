package com.xdlr.qrcode.controller;

import com.xdlr.qrcode.pojo.Device;
import com.xdlr.qrcode.pojo.History;
import com.xdlr.qrcode.service.DeviceService;
import com.xdlr.qrcode.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

@Controller
@RequestMapping("/history")
public class HistoryController {
    @Autowired
    private HistoryService historyService;
    @Autowired
    private DeviceService deviceService;
    @Autowired
    private DetailController detailController;

    @RequestMapping("/delete")
    public ModelAndView deleteHistory(@RequestParam(value = "deviceId") String deviceId,
                                      @RequestParam(value = "historyId") Integer historyId,
                                      HttpSession session,
                                      Map<String, Object> map) {
        Device device = deviceService.findById(deviceId);
        History history = historyService.findById(historyId);
        if (device != null && history != null && session.getAttribute("username") != null && session.getAttribute("username") != "") {
            historyService.deleteHistory(historyId);
            return detailController.detailPage(deviceId, 1, 10, map);
        }
        return new ModelAndView("common/error", map);
    }

    @RequestMapping("/add")
    public ModelAndView addHistory(@RequestParam(value = "deviceId") String deviceId,
                                   @RequestParam(value = "date") String date,
                                   @RequestParam(value = "price") String price,
                                   @RequestParam(value = "note", defaultValue = "") String note,
                                   Map<String, Object> map) {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            History history = new History(deviceId, simpleDateFormat.parse(date), note, Double.valueOf(price));
            historyService.add(history);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        map.put("deviceId", deviceId);
        return detailController.detailPage(deviceId, 1, 10, map);
    }

    @RequestMapping("/addPage")
    public ModelAndView addHistoryPage(@RequestParam(value = "deviceId") String deviceId,
                                       HttpSession session,
                                       Map<String, Object> map) {
        if ((boolean)session.getAttribute("isLogin")) {
            map.put("deviceId", deviceId);
            return new ModelAndView("device/addHistoryPage", map);
        }
        return new ModelAndView("common/error", map);
    }

}
