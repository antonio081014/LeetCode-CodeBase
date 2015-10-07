/**
 * Problem Link: https://leetcode.com/problems/move-zeroes/
 */

public class Solution {
    public void moveZeroes(int[] nums) {
        int z = 0;
        while(z < nums.length && nums[z] != 0) z++;
        if(z == nums.length) return;
        for(int i=0; i<nums.length; i++) {
            if(nums[i] != 0 && i > z) {
                int tmp = nums[i];
                nums[i] = nums[z];
                nums[z] = tmp;
                z++;
                while(z < nums.length && nums[z] != 0) z++;
                if(z == nums.length) break;
            }
        }
    }
}
