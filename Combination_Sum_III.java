/**
 * Problem Link: https://leetcode.com/problems/combination-sum-iii/
 * 
 * Backtracking Problem, try out all the possible solutions and appropriate prunning 
 */
public class Solution {
    public List<List<Integer>> combinationSum3(int k, int n) {
        list = new ArrayList<List<Integer>>();
        combine(k, 1, n, new ArrayList<Integer>());
        return list;
    }
    
    private List<List<Integer>> list;
    
    private void combine(int k, int start, int left, ArrayList<Integer> ret){
        if(left == 0 && ret.size() == k) {
            list.add(new ArrayList<Integer>(ret));
            return;
        }
        if(ret.size() >= k) return;
        if(ret.size() + 9-start+1 < k) return;
        for(int i=start; i<=9; i++) {
            ret.add(i);
            combine(k, i+1, left-i, ret);
            ret.remove(ret.size()-1);
        }
    }
}
