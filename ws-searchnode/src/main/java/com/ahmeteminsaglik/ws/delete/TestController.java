/*

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class TestController {
    @GetMapping("test1")
    public JSONPObject test1(){
        Student student= new Student("Ahmet Emin",418,new Address("Turkey"));
//        System.out.println("Student :"+student);
//        System.out.println("-------");
        JSONPObject jsonObject= new JSONPObject("student",student);
//        System.out.println("jsonObject.getFunction() : "+jsonObject.getFunction());
//        System.out.println("jsonObject.getValue() : "+jsonObject.getValue());
//        System.out.println("jsonObject.getSerializationType() : "+jsonObject.getSerializationType());
        return jsonObject;
    }

    @GetMapping("test2")
    public List<Student> test2(){
        List<Student> list = new ArrayList<>();
        Student student= new Student("Ahmet Emin",418,new Address("Turkey"));
        list.add(student);
        System.out.print(student);
        return list;
    }
    @GetMapping("test3")
    public List<String> test3(){
        List<String > list = new ArrayList<>();
        list.add("Ahmet Emin");
        list.add("Ahmet Emin");
        list.add("Ahmet Emin");
        list.add("Ahmet Emin");
        return list;
    }
}

*/
