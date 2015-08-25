/**
 * Problem: https://leetcode.com/problems/word-ladder/
 * 
 */
import java.util.*;

class Word implements Comparable<Word>{
    public String word;
    public Word prev;
    public int steps;
    
    public Word(String w) {
        word = w;
        prev = null;
        steps = 1;
    }
    
    @Override
    public int compareTo(Word other) {
        return this.steps - other.steps;
    }
}

public class Solution {
    
    public int ladderLength(String start, String end, Set<String> dict) {
        dict.add(end);
        HashSet<String> unvisited = new HashSet<String>(dict);

        PriorityQueue<Word> q = new PriorityQueue<Word>();
        q.add(new Word(start));
        
        while(!q.isEmpty()) {
            Word w = q.poll();
            
            if (w.word.compareTo(end) == 0) {
                return w.steps;
            }
            
            char[] array = w.word.toCharArray();
            for(int i=0; i<array.length; i++) {
                char tmp = array[i];
                for(char c = 'a'; c <='z'; c++) {
                    if(c != tmp) {
                        array[i] = c;
                        String s = new String(array);
                        if(unvisited.contains(s)) {
                            Word node = new Word(s);
                            node.steps = w.steps + 1;
                            node.prev = w;
                            unvisited.remove(s);
                            q.add(node);
                        }
                    }
                }
                array[i] = tmp;
            }
        }
        return 0;
    }
}
