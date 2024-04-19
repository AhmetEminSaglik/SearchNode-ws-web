package com.ahmeteminsaglik.ws.mapper;

import com.ahmeteminsaglik.ws.model.DataInfoDTO;
import com.ahmeteminsaglik.ws.model.NodeDataDTO;
import com.ahmeteminsaglik.ws.model.SearchNodeDTO;
import org.aes.searchnode.business.concretes.searchnode.SearchNode;
import org.aes.searchnode.entities.DataInfo;
import org.aes.searchnode.entities.NodeData;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SearchNodeMapper {

    public static <T> SearchNodeDTO<T> toDTO(SearchNode<T> searchNode) {
        Set<T> snAddedItemlist = new HashSet<>();
        searchNode.getAll().getData().forEach(e -> snAddedItemlist.add(e.getValue()));

//        System.out.println("---------------");
//        System.out.println("eklenmis itemler : ");
//        snAddedItemlist.forEach(System.out::println);


        List<NodeData<T>> nodeDataList = new ArrayList<>();
        snAddedItemlist.forEach(e -> {
            NodeData<T> nodeData=searchNode.searchNodeData(e.toString()).getData();
            nodeDataList.add(nodeData);
        });

        List<NodeDataDTO<T>> nodeDataListDTO = new ArrayList<>();
        for (NodeData<T> tmp : nodeDataList) {
            List<DataInfo<T>> diList = tmp.getListDataInfo();
            NodeDataDTO<T> nodeDataDTO = toNodeDataDTO(tmp, diList);
            nodeDataListDTO.add(nodeDataDTO);
        }
//        nodeDataListDTO.forEach(System.out::println);
        SearchNodeDTO<T> snDTO = new SearchNodeDTO<>();
        snDTO.setNodeDataDTOList(nodeDataListDTO);
        return snDTO;
    }

    private static <T> NodeDataDTO<T> toNodeDataDTO(NodeData<T> nodeData, List<DataInfo<T>> diList) {
        NodeDataDTO<T> nodeDataDTO = new NodeDataDTO<>();

        nodeDataDTO.setDeep(nodeData.getDeep());
        nodeDataDTO.setNextDirectionsTotalValueNumber(nodeData.getNextDirectionsTotalValueNumber());
        nodeDataDTO.setLocationAddress(nodeData.getLocationAddress());
        nodeDataDTO.setListDataInfoDTO(toDataInfoListDTO(diList));
//        System.out.println("eklenen nodeDataDTO :" + nodeDataDTO);
        return nodeDataDTO;
    }

    private static <T> List<DataInfoDTO<T>> toDataInfoListDTO(List<DataInfo<T>> diList) {
        List<DataInfoDTO<T>> diDTOList = new ArrayList<>();
        for (DataInfo<T> diTmp : diList) {
            DataInfoDTO<T> diDTO = new DataInfoDTO<>();
            diDTO.setIndex(diTmp.getIndex());
            diDTO.setValue(diTmp.getValue());
            diDTO.setTotalSameNum(diTmp.getTotalSameNum());
            diDTO.setExplanation(diTmp.getExplanation());
            diDTOList.add(diDTO);
//            System.out.println("eklen diDTO :" + diDTO);
        }
        return diDTOList;
    }
}
