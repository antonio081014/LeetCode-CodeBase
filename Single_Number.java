/**
 * Problem: https://leetcode.com/problems/single-number/
 */

public class Solution {
    public int singleNumber(int[] nums) {
        int ret = 0;
        for(int x : nums) {
            ret ^= x;
        }
        return ret;
    }
}
