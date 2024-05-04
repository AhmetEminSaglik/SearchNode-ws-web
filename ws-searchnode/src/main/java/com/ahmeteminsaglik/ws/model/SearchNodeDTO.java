package com.ahmeteminsaglik.ws.model;

import com.ahmeteminsaglik.ws.utility.ListUtil;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class SearchNodeDTO<T> {

//    private NodeDataDTO<T> nodeDataDTO;
    private List<NodeDataDTO<T>> nodeDataDTOList;

    public List<NodeDataDTO<T>> getNodeDataDTOList() {
        return nodeDataDTOList;
    }

    public void setNodeDataDTOList(List<NodeDataDTO<T>> nodeDataDTOList) {
        Collections.sort(nodeDataDTOList);
        this.nodeDataDTOList = nodeDataDTOList;
    }

    @Override
    public String toString() {
        return "SearchNodeDTO{" +
                "nodeDataDTOList=" + ListUtil.toString(nodeDataDTOList) +
                '}';
    }
}
