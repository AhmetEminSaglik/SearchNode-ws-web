package com.ahmeteminsaglik.ws.controller;

import com.ahmeteminsaglik.ws.business.abstracts.StackableLoggerQueue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/log")
public class LoggerQueueController {

    private StackableLoggerQueue loggerQueue;

    @Autowired
    public LoggerQueueController(StackableLoggerQueue loggerQueue) {
        this.loggerQueue = loggerQueue;
    }

    @GetMapping
    public List<String> getLoggerQueueData() {
        return loggerQueue.getAllToList();
    }
}
