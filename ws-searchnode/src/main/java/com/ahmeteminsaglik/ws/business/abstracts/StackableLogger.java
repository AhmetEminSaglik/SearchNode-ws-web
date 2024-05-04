package com.ahmeteminsaglik.ws.business.abstracts;

import java.util.List;

public interface StackableLogger {

    void add(String data);
    List<String> getAllToList();
    void enableStackOldLogs();
    void disableStackOldLogs();
    String peek();
    void clear();
}
