package com.ahmeteminsaglik.ws.controller;

import com.ahmeteminsaglik.ws.dataaccess.abstracts.SearchNodeInitializer;
import com.ahmeteminsaglik.ws.mapper.SearchNodeMapper;
import com.ahmeteminsaglik.ws.model.SearchNodeDTO;
import org.aes.searchnode.business.concretes.searchnode.SearchNode;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class SearchNodeController {
    SearchNode<String> sn = SearchNodeInitializer.getSearchNode();

    @GetMapping()
//    public ResponseEntity<SearchNodeDTO<String>> getSearchNodeDTO() {
    public SearchNodeDTO<String> getSearchNodeDTO() {
        if (sn.getTotalItemNumber() == 0) {
//            for(int i=0;i<100;i++){
//                sn.add(i+"");
//            }
            sn.add("Furkan", "Akgun'de calisiyor");
            sn.add("Ahmet", "Ilk ismim");
            sn.add("Ahmet", "Ilk ismim");
//            sn.add("Furkan", "Soyadi Cetin");
//            sn.add("Furkan", "Soyadi Cetin");
            sn.add("Ahmet Emin", "");
        }

        SearchNodeDTO<String> dto = SearchNodeMapper.toDTO(sn);
        return dto;
//        return ResponseEntity.status(HttpStatus.OK).body(dto);
    }

}
