import java.util.*;

public class Solution {
    public List<String> anagrams(String[] strs) {
        List<String> list = new LinkedList<String>();
        Anagrams[] grams = new Anagrams[strs.length];
        for(int i=0; i<strs.length; i++) {
            grams[i] = new Anagrams(strs[i]);
        }
        Arrays.sort(grams);
        boolean flag = false;
        for(int i=1; i<grams.length; i++) {
            if(grams[i].agm.compareTo(grams[i-1].agm) == 0) {
                if(!flag) list.add(grams[i-1].src);
                list.add(grams[i].src);
                flag = true;
            } else {
                flag = false;
            }
        }
        return list;
    }
}

class Anagrams implements Comparable<Anagrams> {
    public String src;
    public String agm;
    public Anagrams(String s) {
        src = s;
        char[] ss = s.toCharArray();
        Arrays.sort(ss);
        agm = new String(ss);
    }
    
    public int compareTo(Anagrams other) {
        if(this.agm.compareTo(other.agm) == 0) return this.src.compareTo(other.src);
        return this.agm.compareTo(other.agm);
    }
}
