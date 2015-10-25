/**
 * Problem Link: https://leetcode.com/problems/search-insert-position/
 */
public class Solution {
    public int searchInsert(int[] nums, int target) {
        int left = 0;
        int right = nums.length-1;
        while(left<right){
            int mid = (left + right) / 2;
            if(nums[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        if(nums[left] < target) return left + 1;
        return left;
    }
}
