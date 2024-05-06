package com.ahmeteminsaglik.ws.controller;

import com.ahmeteminsaglik.ws.business.abstracts.StackableLogger;
import com.ahmeteminsaglik.ws.dataaccess.abstracts.SearchNodeInitializer;
import com.ahmeteminsaglik.ws.mapper.SearchNodeMapper;
import com.ahmeteminsaglik.ws.model.SearchNodeDTO;
import org.aes.searchnode.business.concretes.searchnode.SearchNode;
import org.aes.searchnode.core.utilities.ErrorResult;
import org.aes.searchnode.core.utilities.Result;
import org.aes.searchnode.core.utilities.SuccessDataResult;
import org.aes.searchnode.core.utilities.SuccessResult;
import org.aes.searchnode.entities.NodeDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/searchnode")
@CrossOrigin
public class SearchNodeController {

    private StackableLogger stackableLogger;

    private static final Logger log = LoggerFactory.getLogger(SearchNodeController.class);

    @Autowired
    public SearchNodeController(StackableLogger stackableLogger) {
        this.stackableLogger = stackableLogger;
    }

    SearchNode<String> sn = SearchNodeInitializer.getSearchNode();

    @GetMapping()
//    public ResponseEntity<SearchNodeDTO<String>> getSearchNodeDTO() {
    public SearchNodeDTO<String> getSearchNodeDTO() {
        log.info("All SearchNode data is retrieved");
        SearchNodeDTO<String> dto = SearchNodeMapper.toDTO(sn);
        return dto;
//        return ResponseEntity.status(HttpStatus.OK).body(dto);
    }

    @PostMapping()
    public Result addData(@RequestBody Map<String, String> requestMap) {
        stackableLogger.add("Saved Process:\n Data :[\"" + requestMap.get("data") + "\"]; Explanation :[\"" + requestMap.get("explanation") + "\"]");
//        stackableLogger.add("Saved Process: \"" + requestMap.get("data") +":"+ requestMap.get("explanation") + "\"");
        log.info(stackableLogger.peek());
        sn.add(requestMap.get("data"), requestMap.get("explanation"));
        return new SuccessDataResult<>("Data is added");
    }

    @DeleteMapping()
    public Result removeData(@RequestBody Map<String, String> requestMap) {
        String data = requestMap.get("data");
        NodeDataService<String> nodeDataService = sn.search(data).getData();
        Result result;
        int explanationSize = 0;
        StringBuilder msgSb= new StringBuilder("Deleted Process:\n");
        if (nodeDataService != null) {
            sn.remove(data);
            explanationSize = nodeDataService.getListDataInfo().size();
            msgSb.append("Data :[\"" + requestMap.get("data") + "\"]; Deleted Explanation Size : " + explanationSize);
            result = new SuccessResult("Data is removed.");
        }else{
            msgSb.append("Data :[\"" + requestMap.get("data") + "\"];  Is not found");
            result = new ErrorResult("Data is not found.");
        }
        log.info(msgSb.toString());
        stackableLogger.add(msgSb.toString());
        return result;
    }
}
