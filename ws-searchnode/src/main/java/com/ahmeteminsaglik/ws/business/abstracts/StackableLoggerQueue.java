package com.ahmeteminsaglik.ws.business.abstracts;

import java.util.List;

public interface StackableLoggerQueue {
    void add(String data);
    List<String> getAllToList();
    void enableStackOldLogs();
    void disableStackOldLogs();
}
