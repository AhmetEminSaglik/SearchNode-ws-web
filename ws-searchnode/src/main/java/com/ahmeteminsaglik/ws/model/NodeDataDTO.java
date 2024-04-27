package com.ahmeteminsaglik.ws.model;

import com.ahmeteminsaglik.ws.utility.ListUtil;

import java.util.ArrayList;
import java.util.List;

public class NodeDataDTO<T> {
    private int deep;
    private int nextDirectionsTotalValueNumber;
    private String locationAddress;

    private List<DataInfoDTO<T>> listDataInfoDTO = new ArrayList<>();

    public int getDeep() {
        return deep;
    }

    public void setDeep(int deep) {
        this.deep = deep;
    }

    public int getNextDirectionsTotalValueNumber() {
        return nextDirectionsTotalValueNumber;
    }

    public void setNextDirectionsTotalValueNumber(int nextDirectionsTotalValueNumber) {
        this.nextDirectionsTotalValueNumber = nextDirectionsTotalValueNumber;
    }

    public String getLocationAddress() {
        return locationAddress;
    }

    public void setLocationAddress(String locationAddress) {
        this.locationAddress = locationAddress;
    }

    public List<DataInfoDTO<T>> getListDataInfoDTO() {
        return listDataInfoDTO;
    }

    public void setListDataInfoDTO(List<DataInfoDTO<T>> listDataInfoDTO) {
        this.listDataInfoDTO = listDataInfoDTO;
    }

    @Override
    public String toString() {
        return "NodeDataDTO{" +
                "deep=" + deep +
                ", nextDirectionsTotalValueNumber=" + nextDirectionsTotalValueNumber +
                ", locationAddress='" + locationAddress + '\'' +
//                ", listDataInfoDTO=" + listDataInfoDTO +
                ", listDataInfoDTO=" + ListUtil.toString(listDataInfoDTO) +
                '}';
    }


}
