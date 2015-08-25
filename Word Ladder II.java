import java.util.*;

class Word implements Comparable<Word>{
    public String word;
    public Word prev;
    public int steps;
    
    public Word(String w) {
        word = w;
        prev = null;
        steps = 0;
    }
    
    @Override
    public int compareTo(Word other) {
        return this.steps - other.steps;
    }
}

public class Solution {
    
    public List<List<String>> findLadders(String start, String end, Set<String> dict) {
        List<List<String>> list = new ArrayList<List<String>>();
        Integer minSteps = Integer.MAX_VALUE;
        Integer prevCount = 0;
        
        dict.add(end);
        HashSet<String> unvisited = new HashSet<String>(dict);
        HashSet<String> visited = new HashSet<String>();

        PriorityQueue<Word> q = new PriorityQueue<Word>();
        q.add(new Word(start));
        visited.add(start);
        
        while(!q.isEmpty()) {
            Word w = q.poll();
            
            if (w.word.compareTo(end) == 0) {
                if(list.size()!=0 && minSteps > w.steps + 1) {
                    list.clear();
                }
                minSteps = Math.min(minSteps, w.steps+1);
                if(minSteps == w.steps + 1) {
                    List<String> ret = new ArrayList<String>();
                    while(w != null) {
                        ret.add(0, w.word);
                        w = w.prev;
                    }
                    list.add(ret);
                }
                continue;
            }
            // We only clear our all the visited nodes when we have iterated all the nodes with prevCount.
            // So, here we start taking care of nodes with steps = prevCount + 1.
            // This looks like a search layer by layer. Every node in the next layer could be the this node's next node.
            // Otherwise, it's easy to miss possible solutions.
            if(w.steps > prevCount) {
                unvisited.removeAll(visited);
            }
            prevCount = w.steps;
            
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
                            visited.add(s);
                            q.add(node);
                        }
                    }
                }
                array[i] = tmp;
            }
        }
        return list;
    }
}
