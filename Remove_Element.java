/**
 * Problem: https://leetcode.com/problems/remove-element/
 */
public class Solution {
    public int removeElement(int[] nums, int val) {
        int len = nums.length;
        for(int i=0; i<len; i++) {
            if(val == nums[i]) {
                while(len > 0 && nums[len-1] == val) len--;
                if(len > i) {
                    nums[i] = nums[len - 1];
                    len--;
                }
            }
        }
        return len;
    }
}
