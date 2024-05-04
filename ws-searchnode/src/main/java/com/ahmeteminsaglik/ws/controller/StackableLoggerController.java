package com.ahmeteminsaglik.ws.controller;

import com.ahmeteminsaglik.ws.business.abstracts.StackableLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/log")
public class StackableLoggerController {

    private StackableLogger stackableLogger;

    @Autowired
    public StackableLoggerController(StackableLogger stackableLogger) {
        this.stackableLogger = stackableLogger;
    }

    @GetMapping
    public List<String> getstackableLoggerData() {
        return stackableLogger.getAllToList();
    }

    @DeleteMapping
    public void deleteLogs() {
        stackableLogger.clear();
    }
}
