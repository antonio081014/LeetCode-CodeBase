/**
 * Problem Link: https://leetcode.com/problems/combinations/
 * 
 * Backtracking Problem, try out all the possible solutions and appropriate prunning 
 */
public class Solution {
    public List<List<Integer>> combine(int n, int k) {
        list = new ArrayList<List<Integer>>();
        combine(n, k, 1, new ArrayList<Integer>());
        return list;
    }
    
    private List<List<Integer>> list;
    
    private void combine(int n, int k, int start, ArrayList<Integer> ret){
        if(ret.size() == k) {
            list.add(new ArrayList<Integer>(ret));
            return;
        }
        if(ret.size() + n-start+1 < k) return;
        for(int i=start; i<=n; i++) {
            ret.add(i);
            combine(n, k, i+1, ret);
            ret.remove(ret.size()-1);
        }
    }
}
