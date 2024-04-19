package com.ahmeteminsaglik.ws.controller;

import com.ahmeteminsaglik.ws.mapper.SearchNodeMapper;
import com.ahmeteminsaglik.ws.model.SearchNodeDTO;
import org.aes.searchnode.business.concretes.searchnode.SearchNode;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class SearchNodeController {


    @GetMapping()
    public SearchNodeDTO<String> getSearchNodeDTO() {
        SearchNode<String> searchNode = new SearchNode<>();
        searchNode.add("Ahmet Emin", "Ahmet Emin is the longest word that is added");
        searchNode.add("Ahmet", "5 characters");
        searchNode.add("Ahmet", "added 2. times");
        searchNode.add("Ahmet", "added 3. times");
        searchNode.add("emine", "This is another word completely different");
        SearchNodeDTO<String> dto = SearchNodeMapper.toDTO(searchNode);
        return dto;
    }
}
