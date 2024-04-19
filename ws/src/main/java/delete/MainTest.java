package delete;

import org.aes.searchnode.business.concretes.searchnode.SearchNode;

public class MainTest {
    public static void main(String[] args) {
        SearchNode<String> sn = new SearchNode<>();
        sn.add("Ahmet");
        sn.add("Emin");
        System.out.println(sn.searchNodeData("Ahme"));
        System.out.println("---------------------------------");
        System.out.println(sn.searchNodeData("Ahmet"));
        System.out.println("---------------------------------");
        System.out.println(sn.searchNodeData("Emin"));
        System.out.println("---------------------------------");
        sn.getAll().getData().forEach(System.out::println);

    }
}
