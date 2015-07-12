import java.util.*;

public class Solution {
    
    private List<Integer> mark[];
    private List<String> list;
    
    public List<String> wordBreak(String s, Set<String> wordDict) {
        mark = new ArrayList[s.length() + 1];
//        for(int i=0; i<s.length(); i++) mark.add(new ArrayList<Integer>());
        mark[0] = new ArrayList<Integer>();
        list = new ArrayList<String>();
        
//        for(int i=0; i<s.length(); i++) {
//            for(String word : wordDict) {
//                if(s.substring(i).startsWith(word)) {
//                    mark.get(i).add(i + word.length());
//                }
//            }
//        }
        
        for(int i=0; i<s.length(); i++) {
            if (mark[i] == null) { continue; }
            for(String word : wordDict) {
                int end = i + word.length();
                if(end > s.length()) continue;
                if(s.substring(i, end).compareTo(word) == 0) {
                    if (mark[end] == null) mark[end] = new ArrayList<Integer>();
                    mark[i].add(end);
                }
            }
        }
        
        if (mark[s.length()] == null) return list;
        
        backtrack(s, 0, wordDict, "");
        return list;
    }
    
    private void backtrack(String s, int k, Set<String> wordDict, String ret) {
        if(k == s.length()) {
            list.add(ret.substring(1));
            return;
        }
        
        if(mark[k] != null) {
            for(Integer j : mark[k]) {
                backtrack(s, j, wordDict, ret + " " + s.substring(k, j));
            }
        }
//        for(String word : wordDict) {
//            if(s.substring(k).startsWith(word)) {
//                backtrack(s, k+word.length(), wordDict, ret + " " + word);
//            }
//        }
    }
    
    
    
}
