/**
 * Problem: https://leetcode.com/problems/sliding-window-maximum/
 * 
 * Using Deque with Queue implementation.
 * 
 * There is another solution for this problem, using a prioirty queue, 
 * which will have a pair of value and position in the queue.
 * Each time before adding any elements, remove the top elements if they are out of the window.
 */

public class Solution {
    public int[] maxSlidingWindow(int[] nums, int w) {
        if(nums.length == 0 || w == 0) return nums;
        
        int[] ret = new int[nums.length - w + 1];
        Deque<Integer> q = new LinkedList<Integer>();
        for(int i=0; i<w; i++) {
            // Only keep the largest element in the queue for the first w elements.
            while(!q.isEmpty() && nums[q.getLast()] < nums[i]) q.removeLast();
            q.addLast(i);
        }
        
        for(int i=w; i<nums.length; i++) {
            ret[i-w] = nums[q.getFirst()];
            // Only keep the elements larger than current element, 
            // since these elements have no chance to be the one.
            while(!q.isEmpty() && nums[q.getLast()] < nums[i]) q.removeLast();
            // Remove all the elements which will be out of the window slide.
            while(!q.isEmpty() && q.getFirst() <= i-w ) q.removeFirst();
            q.addLast(i);
        }
        ret[nums.length - w] = nums[q.getFirst()];
        
        return ret;
    }
}
