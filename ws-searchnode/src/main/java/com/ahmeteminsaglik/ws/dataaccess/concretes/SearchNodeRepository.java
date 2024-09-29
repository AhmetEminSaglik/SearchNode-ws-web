/*
package com.ahmeteminsaglik.ws.dataaccess.concretes;

import com.ahmeteminsaglik.ws.dataaccess.abstracts.SearchNodeInitializer;
import org.ahmeteminsaglik.searchnode.business.concretes.searchnode.SearchNode;
import org.ahmeteminsaglik.searchnode.core.utilities.DataResult;
import org.ahmeteminsaglik.searchnode.core.utilities.Result;
import org.ahmeteminsaglik.searchnode.entities.DataInfo;
import org.ahmeteminsaglik.searchnode.entities.NodeData;
import org.ahmeteminsaglik.searchnode.entities.NodeDataService;

import java.util.List;

public class SearchNodeRepository<T> implements SearchNodeInitializer<T> {
    private SearchNode<T> searchNode = new SearchNode<>();
    private static SearchNodeRepository repository;

    private SearchNodeRepository() {
    }

    public static <T> SearchNodeRepository<T> build() {
        if (repository == null) {
            repository = new SearchNodeRepository<T>();
        }
        return repository;
    }

    @Override
    public DataResult<NodeDataService<T>> search(String s) {
        return searchNode.search(s);
    }

    @Override
    public DataResult<NodeDataService<T>> getExplanationOf(String s) {
        return searchNode.getExplanationOf(s);
    }

    @Override
    public Result add(T t) {
        return searchNode.add(t);
    }

    @Override
    public Result add(T t, String s) {
        return searchNode.add(t, s);
    }

    @Override
    public Result add(T t, List<String> list) {
        return searchNode.add(t, list);
    }

    @Override
    public Result addAll(List<T> list) {
        return searchNode.addAll(list);
    }

    @Override
    public Result remove(T t) {
        return searchNode.remove(t);
    }

    @Override
    public DataResult<List<T>> removeAll(List<T> list) {
        return searchNode.removeAll(list);
    }

    @Override
    public Result update(T t, String s, String s1) {
        return searchNode.update(t, s, s1);
    }

    @Override
    public Result update(T t, String s, List<String> list) {
        return searchNode.update(t, s, list);
    }

    @Override
    public Result update(T t, List<String> list) {
        return searchNode.update(t, list);
    }

    @Override
    public DataResult<List<DataInfo<T>>> getAll() {
        return searchNode.getAll();
    }

    @Override
    public DataResult<List<DataInfo<T>>> getAllReverse() {
        return searchNode.getAllReverse();
    }

    @Override
    public DataResult<List<DataInfo<T>>> getAllStartWith(String s) {
        return searchNode.getAllStartWith(s);
    }

    @Override
    public int getTotalItemNumber() {
        return searchNode.getTotalItemNumber();
    }

    @Override
    public Result resetPriorityChar(char c) {
        return searchNode.resetPriorityChar(c);
    }

    @Override
    public Result resetAllPriorityChars() {
        return searchNode.resetAllPriorityChars();
    }

    @Override
    public Result updatePriorityChar(List<Character> list, char c) {
        return searchNode.updatePriorityChar(list, c);
    }

    @Override
    public Result updatePriorityChar(char c, char c1) {
        return searchNode.updatePriorityChar(c, c1);
    }

    @Override
    public DataResult<NodeData<T>> searchNodeData(String s) {
        return searchNode.searchNodeData(s);
    }

    @Override
    public List<NodeData<T>> getAllNodeData(String s) {
        return searchNode.getAllNodeData(s);
    }

    */
/*@Override
    public Result save(T t) {
        return searchNode.add(t);
    }

    @Override
    public Result remove(T t) {
        return searchNode.remove(t);
    }

    @Override
    public DataResult<NodeDataService<T>> getByValue(String data) {
        return searchNode.search(data);
    }

    @Override
    public DataResult<NodeDataService<T>> getByExplanation(String exp) {
        return searchNode.getExplanationOf(exp);
    }*//*


 */
/*
    @Override
    public Result save(String s) {
        return searchNode.add(s).isSuccess();
    }

    @Override
    public Result remove(String s) {
        return searchNode.remove(s).isSuccess();
    }

    @Override
    public DataResult<String> getByValue(String s) {
        return "";
    }

    @Override
    public DataResult<String> getByExplanation(String exp) {
        return "";
    }*//*

}
*/
