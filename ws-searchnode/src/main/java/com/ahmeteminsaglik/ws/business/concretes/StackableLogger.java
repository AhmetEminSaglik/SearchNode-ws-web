package com.ahmeteminsaglik.ws.business.concretes;

import com.ahmeteminsaglik.ws.business.abstracts.StackableLoggerQueue;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class StackableLogger implements StackableLoggerQueue {
    private Queue<String> queue = new LinkedList<>();
    private boolean isEnableStackOldLogs;

    public StackableLogger() {
        enableStackOldLogs();
    }

    @Override
    public void add(String data) {
        queue.add(data);
    }

    @Override
    public List<String> getAllToList() {
        List<String> list = new ArrayList<>();
        queue.forEach(e->list.add(e));
        if(isEnableStackOldLogs==false){
            queue.clear();
        }
//        while (!queue.isEmpty()) {
//            list.add(queue.poll());
//        }
        System.out.println("quuqe size : " + queue.size());
        return list;
    }
    @Override
    public void enableStackOldLogs() {
        isEnableStackOldLogs = true;
    }

    @Override
    public void disableStackOldLogs() {
        isEnableStackOldLogs = false;
    }
}
