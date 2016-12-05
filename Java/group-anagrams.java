import java.util.*;

public class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        List<List<String>> list = new ArrayList<List<String>>();
        Anagrams[] grams = new Anagrams[strs.length];
        for(int i=0; i<strs.length; i++) {
            grams[i] = new Anagrams(strs[i]);
        }
        Arrays.sort(grams);
        
        for(Anagrams g : grams) {
            System.out.println("<" + g.src + "_:_" + g.agm + ">");
        }
        
        ArrayList<String> lst = new ArrayList<String>();
        for(int i=0; i<strs.length; i++) {
            if(lst.size() != 0 && grams[i].agm.compareTo(grams[i-1].agm) != 0) {
                list.add(lst);
                lst = new ArrayList<String>();
            }
            lst.add(grams[i].src);
        }
        if(lst.size() > 0) list.add(lst);
        // //Sorting
        // Collections.sort(list, new Comparator<List>() {
        //     @Override
        //     public int compare(List list1, List list2)
        //     {
        //         return list2.size() - list1.size();
        //     }
        // });
        return list;
    }
}

class Anagrams implements Comparable<Anagrams> {
    public String src;
    public String agm;
    public Anagrams(String s) {
        src = s;
        if (s.length() > 0) {
            char[] ss = s.toCharArray();
            Arrays.sort(ss);
            agm = new String(ss);
        } else {
            agm = s;
        }
}
    
    public int compareTo(Anagrams other) {
        if(this.agm.compareTo(other.agm) == 0) return this.src.compareTo(other.src);
        return this.agm.compareTo(other.agm);
    }
}
