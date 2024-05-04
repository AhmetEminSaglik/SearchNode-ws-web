package com.ahmeteminsaglik.ws.controller;

import com.ahmeteminsaglik.ws.dataaccess.abstracts.SearchNodeInitializer;
import com.ahmeteminsaglik.ws.mapper.SearchNodeMapper;
import com.ahmeteminsaglik.ws.model.SearchNodeDTO;
import org.aes.searchnode.business.concretes.searchnode.SearchNode;
import org.aes.searchnode.core.utilities.Result;
import org.aes.searchnode.core.utilities.SuccessDataResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping
@CrossOrigin
public class SearchNodeController {
    private static final Logger log = LoggerFactory.getLogger(SearchNodeController.class);
    SearchNode<String> sn = SearchNodeInitializer.getSearchNode();

    @GetMapping()
//    public ResponseEntity<SearchNodeDTO<String>> getSearchNodeDTO() {
    public SearchNodeDTO<String> getSearchNodeDTO() {
        if (sn.getTotalItemNumber() == 0) {
//            for(int i=0;i<100;i++){
//                sn.add(i+"");
//            }
//            sn.add("Furkan", "Akgun'de calisiyor");
            sn.add("AES", "AES BIGGER");
//            sn.add("aes", "aes smaller");
//            sn.add("Ahmet", "");
//            sn.add("Ahmet", "fake data");
//            sn.add("Ahmet", "fake data");
//            sn.add("Ahmet", "Ilk ismim");
//            sn.add("Furkan", "Soyadi Cetin");
//            sn.add("Furkan", "Soyadi Cetin");
//            sn.add("Ahmet Emin", "");
        }

        SearchNodeDTO<String> dto = SearchNodeMapper.toDTO(sn);
        return dto;
//        return ResponseEntity.status(HttpStatus.OK).body(dto);
    }

    @PostMapping()
    public Result addData(@RequestBody Map<String, String> requestMap) {
        log.info("Data ve explanation SearchNode'a eklencek --> Data : " + requestMap.get("data") + " /  explanation : " + requestMap.get("explanation"));
//        for (int i = 0; i < 30_000; i++) {
//            sn.add("0", i + " kez eklendi");
//            log.info("Data ekleniyor : "+i);
//        }
        sn.add(requestMap.get("data"), requestMap.get("explanation"));
        return new SuccessDataResult<>("Data is added");
    }

}
