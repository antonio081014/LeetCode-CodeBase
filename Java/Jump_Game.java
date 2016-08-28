/**
 * Problem Link: https://leetcode.com/problems/jump-game/
 * Solution: Greedy to find out if the end could be reached.
 * Using BFS could find the path with minimum steps to reach the end.
 */
public class Solution {
    public boolean canJump(int[] nums) {
        int max = 0;
        for(int i=0; i<nums.length; i++) {
            if(max < i) return false;
            if(i + nums[i] > max) max = i + nums[i];
        }
        return max >= nums.length - 1;
    }
    
}
