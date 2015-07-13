public class Solution {
    
    private List<List<Integer>> ret;
    public List<List<Integer>> permute(int[] nums) {
        ret = new ArrayList<List<Integer>>();
        int[] index = new int[nums.length];
        for(int i=0; i<nums.length; i++) index[i] = -1;
        Arrays.sort(nums);
        backtrack(nums, 0, index);
        return ret;
    }
    
    private void backtrack(int[] nums, int k, int[] index) {
        if(k == nums.length) {
            Integer[] xx = new Integer[nums.length];
            for(int i=0; i<nums.length; i++) {
                xx[index[i]] = nums[i];
            }
            ret.add(Arrays.asList(xx));
            return;
        }
        
        for(int i=0; i<nums.length; i++) {
            // Make sure no duplicate permutation here after the check.
            // if(i>0 && nums[i] == nums[i-1] && index[i-1] == -1) continue;
            
            if(index[i] == -1) {
                index[i] = k;
                backtrack(nums, k+1, index);
                index[i] = -1;
            }
        }
    }
}
