/**
 * Problem Link: https://leetcode.com/problems/word-pattern/
 */
import java.util.*;

public class Solution {
    public boolean wordPattern(String pattern, String str) {
        String[] ss = str.split(" ");
        HashMap<String, String> map = new HashMap<String, String>();
        
        if(ss.length != pattern.length()) return false;
        
        for(int i=0; i<ss.length; i++) {
            String c = "" + pattern.charAt(i);
            String s = ss[i];
            if(map.get(c) == null && map.get(s) == null) {
                map.put(c, s);
                map.put(s, c);
            } else if(map.get(c) == null || map.get(s) == null || map.get(c).compareTo(s) != 0 || map.get(s).compareTo(c) != 0) {
                return false;
            }
        }
        return true;
    }
}
