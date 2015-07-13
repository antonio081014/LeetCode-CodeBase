public class Solution {
    public int maxSubArray(int[] nums) {
        int max_sofar = nums[0];
        int max_endinghere = nums[0];
        for(int i=1; i<nums.length; i++) {
            max_endinghere = Math.max(max_endinghere + nums[i], nums[i]);
            max_sofar = Math.max(max_sofar, max_endinghere);
        }
        return max_sofar;
    }
}
