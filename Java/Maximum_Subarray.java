public class Solution {
    /**
     * Time Complexity: O(n)
     * Linear with Dynamic Programing.
     */
    public int maxSubArray(int[] nums) {
        int max_sofar = nums[0];
        int max_endinghere = nums[0];
        for(int i=1; i<nums.length; i++) {
            max_endinghere = Math.max(max_endinghere + nums[i], nums[i]);
            max_sofar = Math.max(max_sofar, max_endinghere);
        }
        return max_sofar;
    }
    
    /**
     * Time Complexity: O(nlogn)
     * Divide and Conqure.
     */
    public int maxSubArray(int[] nums) {
        return divide_conqure(nums, 0, nums.length-1);
    }
    
    private int divide_conqure(int[] nums, int left, int right) {
        if(left == right) return nums[left];
        int mid = (left + right) / 2;
        int max1 = divide_conqure(nums, left, mid);
        int max2 = divide_conqure(nums, mid + 1, right);
        int max3 = Integer.MIN_VALUE;
        int sum3 = 0;
        for(int i=mid; i>=left; i--) {
            sum3 += nums[i];
            max3 = Math.max(max3, sum3);
        }
        int max4 = Integer.MIN_VALUE;
        int sum4 = 0;
        for(int i=mid+1; i<=right; i++) {
            sum4 += nums[i];
            max4 = Math.max(max4, sum4);
        }
        
        return Math.max(max1, Math.max(max2, max3 + max4));
    }
}
