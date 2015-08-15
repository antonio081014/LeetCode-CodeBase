/**
 * Problem: https://leetcode.com/problems/majority-element/
 */

public class Solution {
    public int majorityElement(int[] nums) {
        int result = 0;
        int count = 0;
        
        for(int i=0; i<nums.length; i++) {
            if(count == 0 || nums[i] == result) {
                result = nums[i];
                count++;
            } else {
                count--;
            }
        }
        return result;
    }
}
