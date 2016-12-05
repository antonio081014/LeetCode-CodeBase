/**
 * Problem: https://leetcode.com/problems/longest-consecutive-sequence/
 **/
public class Solution {
    public int longestConsecutive(int[] nums) {
        HashSet<Integer> set = new HashSet<Integer>();
        for(int n : nums) {
            set.add(n);
        }
        
        int max = 0;
        for(int n : nums) {
            int count = 1;
            int left = n - 1;
            int right = n + 1;
            while(set.contains(left)) {
                count++;
                set.remove(left);
                left--;
            }
            while(set.contains(right)) {
                count++;
                set.remove(right);
                right++;
            }
            max = Math.max(max, count);
        }
        return max;
    }
}
