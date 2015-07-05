/**
 * Problem: https://leetcode.com/problems/trapping-rain-water/
 * 
 */
public class Solution {
    public int trap(int[] height) {
        int len = height.length;
        int[] maxLeft = new int[len];
        int[] maxRight = new int[len];
        
        for(int i=1; i<len; i++) {
            maxLeft[i] = Math.max(maxLeft[i-1], height[i-1]);
        }
        for(int i=len-2; i>=0; i--) {
            maxRight[i] = Math.max(maxRight[i+1], height[i+1]);
        }
        
        int total = 0;
        for(int i=0; i<len; i++) {
            total += Math.max(0, Math.min(maxLeft[i], maxRight[i]) - height[i]);
        }
        
        return total;
    }
}
