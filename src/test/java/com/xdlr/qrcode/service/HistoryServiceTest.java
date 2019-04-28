package com.xdlr.qrcode.service;

import com.xdlr.qrcode.pojo.History;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@SpringBootTest
@RunWith(SpringRunner.class)
public class HistoryServiceTest {

    @Autowired
    HistoryService service;

    @Test
    public void findByDeviceId() {
        Pageable pageable = PageRequest.of(0,10);
        Page<History> page = service.findByDeviceId("5504671030",pageable);
        Assert.assertNotNull(page.getContent());
        System.out.println(page.getContent().toString());
    }
}