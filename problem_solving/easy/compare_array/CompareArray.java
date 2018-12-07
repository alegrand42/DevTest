import java.io.*;
import java.util.ArrayList;
import java.util.List;


public class CompareArray{

   static void printListString(List<String> arr){
        for(String a : arr)
            System.out.println(a);
   }

   static List<String> removeIfDuplicate(List<String> a, List<String> b){
        a.removeAll(b);
        return a;
   }

   public static void main(String arg[]) {
        List<String> a = new ArrayList<String>();
        a.add("123");
        a.add("456");
        a.add("789");
        List<String> b = new ArrayList<String>();
        b.add("123");
        b.add("abc");

        printListString(removeIfDuplicate(a, b));
   }

}
