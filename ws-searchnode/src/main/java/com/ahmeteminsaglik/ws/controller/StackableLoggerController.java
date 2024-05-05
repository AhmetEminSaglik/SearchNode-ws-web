package com.ahmeteminsaglik.ws.controller;

import com.ahmeteminsaglik.ws.business.abstracts.StackableLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/log")
@CrossOrigin
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
