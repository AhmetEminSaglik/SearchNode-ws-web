import com.ahmeteminsaglik.ws.mapper.SearchNodeMapper;
import com.ahmeteminsaglik.ws.model.SearchNodeDTO;
import org.aes.searchnode.business.abstracts.searchnode.SearchNodeService;
import org.aes.searchnode.business.concretes.searchnode.SearchNode;

public class Main {
    public static void main(String[] args) {
        SearchNode<String> sn = new SearchNode<>();

        if(sn.getTotalItemNumber()==0){
            sn.add("a","2");
//            sn.add("ca","4");
            sn.add("a","1");
//            sn.add("ca","3");
            sn.add("a");
            sn.add("b");
            sn.add("c");
            sn.add("d");
//            sn.add("d");
//            sn.add("a");
//            sn.add("b");
            sn.updatePriorityChar('d','a');// a c b d -> a c d b
            sn.updatePriorityChar('a','c');// a c b d -> a c d b
        }
//        sn.getAll().forEach(e->e.ge);
        SearchNodeDTO<String> dto = SearchNodeMapper.toDTO(sn);
        dto.getNodeDataDTOList().forEach(e->{
            e.getListDataInfoDTO().forEach(f->{
                System.out.println(f.getValue()+":"+f.getExplanation());
            });
        });
    }
}
