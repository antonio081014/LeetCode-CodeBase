/**
 * Problem: https://leetcode.com/problems/sliding-window-maximum/
 * 
 * Using Deque with Queue implementation.
 */

public class Solution {
    public int[] maxSlidingWindow(int[] nums, int w) {
        if(nums.length == 0 || w == 0) return nums;
        
        int[] ret = new int[nums.length - w + 1];
        Deque<Integer> q = new LinkedList<Integer>();
        for(int i=0; i<w; i++) {
            while(!q.isEmpty() && nums[q.getLast()] < nums[i]) q.removeLast();
            q.addLast(i);
        }
        
        for(int i=w; i<nums.length; i++) {
            ret[i-w] = nums[q.getFirst()];
            while(!q.isEmpty() && nums[q.getLast()] < nums[i]) q.removeLast();
            while(!q.isEmpty() && q.getFirst() <= i-w ) q.removeFirst();
            q.addLast(i);
        }
        ret[nums.length - w] = nums[q.getFirst()];
        
        return ret;
    }
}
