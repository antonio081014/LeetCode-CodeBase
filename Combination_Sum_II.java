/**
 * Problem: https://leetcode.com/problems/combination-sum-ii/
 */

public class Solution {
    
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        Set<List<Integer>> result = new HashSet<List<Integer>>();
        if(candidates.length == 0) return new ArrayList<List<Integer>>();
        List<Integer> current = new ArrayList<Integer>();
        Arrays.sort(candidates);
        combinationSum(candidates, target, 0, current, result);
        return new ArrayList<List<Integer>>(result);
    }
    
    public void combinationSum(int[] candidates, int target, int start, List<Integer> curr, Set<List<Integer>> result){
        if(target == 0) {
            List<Integer> tmp = new ArrayList<Integer>(curr);
            result.add(tmp);
            return;
        }
        if(start >= candidates.length) return;
        for(int i=start; i<candidates.length; i++) {
            if(target < candidates[start]) return;
            curr.add(candidates[i]);
            combinationSum(candidates, target - candidates[i], i+1, curr, result);
            curr.remove(curr.size()-1); 
        }
    }
}
