/**
 * Problem Link: https://leetcode.com/problems/find-the-duplicate-number/
 * 
 * Binary Search.
 */

public class Solution {
    public int findDuplicate(int[] nums) {
        int left = 1; 
        int right = nums.length - 1;
        while(left < right) {
            int mid = (left + right) / 2;
            int g = 0;
            for(int i=0; i<nums.length; i++) {
                if(nums[i] <= mid) g++;
            }
            if(g <= mid) left = mid + 1;
            else right = mid;
        }
        return left;
    }
}
