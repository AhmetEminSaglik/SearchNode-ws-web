package com.ahmeteminsaglik.ws.dataaccess.abstracts;

import lombok.Getter;
import org.ahmeteminsaglik.searchnode.business.concretes.searchnode.SearchNode;

public class SearchNodeInitializer {
    @Getter
    private static SearchNode<String> searchNode = new SearchNode<>();
}
