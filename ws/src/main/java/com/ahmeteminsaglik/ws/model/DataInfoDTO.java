package com.ahmeteminsaglik.ws.model;

public class DataInfoDTO<T> {
    private T value;
    private int index;
    private String explanation;
    private int totalSameNum = 0;

    public T getValue() {
        return value;
    }

    public void setValue(T value) {
        this.value = value;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public int getTotalSameNum() {
        return totalSameNum;
    }

    public void setTotalSameNum(int totalSameNum) {
        this.totalSameNum = totalSameNum;
    }

    @Override
    public String toString() {
        return "DataInfoDTO{" +
                "value=" + value +
                ", index=" + index +
                ", explanation='" + explanation + '\'' +
                ", totalSameNum=" + totalSameNum +
                '}';
    }
}
