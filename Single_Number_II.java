/**
 * Problem: https://leetcode.com/problems/single-number-ii/
 * x, y 两个变量。
 * 当同一个数第一次出现的时候，x 被设为那个数。
 * 当第二次出现的时候，x被清0，y被设置为那个数。
 * 当第三次出现的时候，y被清0。
 * 因为有一个数只出现一次，所以最后x就是那个数.
 */

public class Solution {
    public int singleNumber(int[] nums) {
        int x = 0x0;
        int y = 0x0;
        for(int n : nums) {
            x ^= ~y & n;
            y ^= ~x & n;
        }
        return x;
    }
}
