package com.ahmeteminsaglik.ws.business.concretes;

import com.ahmeteminsaglik.ws.business.abstracts.StackableLogger;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

@Service
public class StackableLoggerManager implements StackableLogger {
    private Stack<String> stack = new Stack<>();
    private boolean isEnableStackOldLogs;

    public StackableLoggerManager() {
        enableStackOldLogs();
//        disableStackOldLogs();
    }

    @Override
    public void add(String data) {
        StringBuilder sb = getTime();
        sb.append("   ");
        sb.append(data);
        stack.add(sb.toString());
    }

    @Override
    public List<String> getAllToList() {
        List<String> list = new ArrayList<>();
        stack.forEach(e -> list.add(e));
        if (isEnableStackOldLogs == false) {
            clear();
        }
//        while (!queue.isEmpty()) {
//            list.add(queue.poll());
//        }
        System.out.println("quuqe size : " + stack.size());
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

    @Override
    public String peek() {
// todo  queue'de en son eklenen veriyi alma
        return stack.peek();
    }

    @Override
    public void clear() {
        stack.clear();
        System.out.println("stack is cleared. Size : "+stack.size());
    }

    private StringBuilder getTime() {
        LocalDateTime time = LocalDateTime.now();
        StringBuilder stringBuffer = new StringBuilder();

        stringBuffer.append(getTimeToBinaryFormat(time.getHour())).append(":");
        stringBuffer.append(getTimeToBinaryFormat(time.getMinute())).append(":");
        stringBuffer.append(getTimeToBinaryFormat(time.getSecond()));
        return stringBuffer;
    }

    private String getTimeToBinaryFormat(int val) {
        return val < 10 ? "0" + val : Integer.toString(val);
    }
}
