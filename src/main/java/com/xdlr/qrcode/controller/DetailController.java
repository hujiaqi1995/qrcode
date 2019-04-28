package com.xdlr.qrcode.controller;

import com.xdlr.qrcode.pojo.Device;
import com.xdlr.qrcode.pojo.History;
import com.xdlr.qrcode.service.DeviceService;
import com.xdlr.qrcode.service.HistoryService;
import com.xdlr.qrcode.util.DeviceDTO;
import com.xdlr.qrcode.util.HistoryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class DetailController {
    @Autowired
    private DeviceService deviceService;

    @Autowired
    private HistoryService historyService;

    @RequestMapping("/detailPage")
    public ModelAndView detailPage(@RequestParam(value = "deviceId") String deviceId,
                                   @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                   @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                   Map<String, Object> map) {
        Device device = deviceService.findById(deviceId);
        if (device != null) {
            DeviceDTO dto = DeviceDTO.device2DeviceDTO(device);
            Sort sort = new Sort(Sort.Direction.DESC, "date");
            Pageable pageable = PageRequest.of(pageNum - 1, pageSize, sort);
            Page<History> historyPage = historyService.findByDeviceId(deviceId, pageable);
            List<History> histories = historyPage.getContent();
            List<HistoryDTO> dtos = new ArrayList<>();
            for (History history:histories) {
                dtos.add(HistoryDTO.history2DTO(history));
            }
            map.put("dto", dto);
            map.put("historyPage", historyPage);
            map.put("currentPage", pageNum);
            map.put("pageSize", pageSize);
            map.put("histories", dtos);
            return new ModelAndView("device/detail", map);
        }
        return new ModelAndView("login/login", map);
    }

}
