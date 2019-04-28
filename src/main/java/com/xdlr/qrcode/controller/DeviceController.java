package com.xdlr.qrcode.controller;

import com.xdlr.qrcode.pojo.Device;
import com.xdlr.qrcode.service.DeviceService;
import com.xdlr.qrcode.util.DeviceDTO;
import com.xdlr.qrcode.util.GlobalVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/device")
public class DeviceController {
    @Autowired
    private DeviceService deviceService;
    @Autowired
    private DetailController detailController;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView findAll(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                Map<String, Object> map) {
        Sort sort = new Sort(Sort.Direction.DESC, "date");
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize, sort);
        Page<Device> devicePage = deviceService.findAll(pageable);
        List<Device> deviceList = devicePage.getContent();
        List<DeviceDTO> deviceDTOS = new ArrayList<>();
        for (int i = 0; i < deviceList.size(); i++) {
            deviceDTOS.add(DeviceDTO.device2DeviceDTO(deviceList.get(i)));
        }
        map.put("deviceDTOS", deviceDTOS);
        map.put("currentPage", pageNum);
        map.put("pageSize", pageSize);
        map.put("devicePage", devicePage);
        return new ModelAndView("device/list", map);
    }

    @RequestMapping("/detailPage")
    public ModelAndView detailPage(@RequestParam(value = "deviceId") String deviceId,
                                   Map<String, Object> map) {
        Device device = deviceService.findById(deviceId);
        if (device != null) {
            DeviceDTO dto = DeviceDTO.device2DeviceDTO(device);
            map.put("dto", dto);
            return new ModelAndView("device/detail", map);
        }
        return new ModelAndView("login/login", map);
    }

    @RequestMapping("/detailPageByName")
    public ModelAndView detailPageByName(@RequestParam(value = "deviceName") String deviceName,
                                         Map<String, Object> map) {
        Device device = deviceService.findByName(deviceName.trim());
        if (device != null) {
            return detailController.detailPage(device.getId(), 1, 10, map);
        }
        return new ModelAndView("common/error", map);
    }

    @RequestMapping(value = "/qrcodePage")
    public ModelAndView qrcode(@RequestParam(value = "deviceId") String deviceId,
                               Map<String, Object> map) {
        Device device = deviceService.findById(deviceId);
        if (device != null) {
            String qrcodePath = GlobalVariable.QR_CODE_IMAGE_PATH + deviceId + ".jpg";
            DeviceDTO deviceDTO = DeviceDTO.device2DeviceDTO(device);
            map.put("dto", deviceDTO);
            map.put("qrcodePath", qrcodePath);
            return new ModelAndView("device/qrcodePage", map);
        } else {
            return new ModelAndView("/login/login", map);
        }
    }

    @RequestMapping(value = "/modifyPage")
    public ModelAndView modifyPage(@RequestParam(value = "deviceId") String deviceId,
                                   Map<String, Object> map) {
        Device device = deviceService.findById(deviceId);
        DeviceDTO dto;
        if (device != null) {
            dto = DeviceDTO.device2DeviceDTO(device);
            map.put("dto", dto);
            return new ModelAndView("device/modify", map);
        }
        return new ModelAndView("device/list", map);
    }

    @RequestMapping(value = "/modify")
    public String modify(@RequestParam(value = "deviceId") String deviceId,
                         @RequestParam(value = "deviceName") String deviceName,
                         @RequestParam(value = "date") String date,
                         @RequestParam(value = "price") String price,
                         @RequestParam(value = "address") String address,
                         @RequestParam(value = "principal") String principal,
                         @RequestParam(value = "category") String category) {
        Device device = deviceService.findById(deviceId);
        if (device != null) {
            try {
                deviceService.modify(deviceId, deviceName,
                        new SimpleDateFormat("yyyy-MM-dd").parse(date),
                        Double.valueOf(price), address, principal, category);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return "redirect:list";
    }

    @RequestMapping("addPage")
    public String addPage() {
        return "device/addPage";
    }

    @RequestMapping("add")
    public String add(@RequestParam(value = "deviceName") String deviceName,
                      @RequestParam(value = "date") String date,
                      @RequestParam(value = "price") String price,
                      @RequestParam(value = "address") String address,
                      @RequestParam(value = "principal") String principal,
                      @RequestParam(value = "category") String category,
                      Map<String, Object> map) {
        try {
            deviceService.add(deviceName, new SimpleDateFormat("yyyy-MM-dd").parse(date),
                    Double.valueOf(price.replace(",", "")), address, principal, category);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "redirect:list";
    }

    @RequestMapping(value = "delete")
    public String delete(@RequestParam(value = "deviceId") String deviceId) {
        Device device = deviceService.findById(deviceId);
        if (device != null) {
            deviceService.delete(deviceId);
        }
        return "redirect:list";
    }


}
