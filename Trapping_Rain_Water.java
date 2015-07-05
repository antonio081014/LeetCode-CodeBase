/**
 * Problem: https://leetcode.com/problems/trapping-rain-water/
 * 
 * To find the trapped water at position i, we need to find the maximum value of the left elements of i and right elements of i. 
 * Assuming they are maxLeft[i] and maxRight[i]. 
 * The trapped water is min(maxLeft[i], maxRight[i]) – height[i] (if this value is larger than 0).
 * 
 * Ref: http://www.lifeincode.net/programming/leetcode-trapping-rain-water-java/
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
