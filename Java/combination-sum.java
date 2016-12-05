/**
 * Problem: https://leetcode.com/problems/combination-sum/
 */

public class Solution {
    
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> result = new ArrayList<List<Integer>>();
        if(candidates.length == 0) return result;
        List<Integer> current = new ArrayList<Integer>();
        Arrays.sort(candidates);
        combinationSum(candidates, target, 0, current, result);
        return result;
    }
    
    public void combinationSum(int[] candidates, int target, int start, List<Integer> curr, List<List<Integer>> result){
        if(target == 0) {
            List<Integer> tmp = new ArrayList<Integer>(curr);
            result.add(tmp);
            return;
        }
        for(int i=start; i<candidates.length; i++) {
            if(target < candidates[start]) return;
            
            curr.add(candidates[i]);
            combinationSum(candidates, target - candidates[i], i, curr, result);
            curr.remove(curr.size()-1); 
        }
    }
}
