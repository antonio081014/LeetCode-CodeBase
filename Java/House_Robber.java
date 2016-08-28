public class Solution {
    public int rob(int[] nums) {
        int n = nums.length;
        int[] cost = new int[n+1];
        int max = 0;
        for(int i=1; i<=n; i++) {
            if(i==1) cost[i] = nums[i-1];
            else {
                cost[i] = Math.max(cost[i-1], nums[i-1] + cost[i-2]);
            }
            max = Math.max(max, cost[i]);
        }
        return max;
    }
}
