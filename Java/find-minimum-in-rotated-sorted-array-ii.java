/**
 * Problem Link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii
 *
 *
 */

public class Solution {
    public int findMin(int[] nums) {
        for(int i=0; i+1<nums.length; i++) {
            if(nums[i] > nums[i+1]) return nums[i+1];
        }
        return nums[0];
    }
}
