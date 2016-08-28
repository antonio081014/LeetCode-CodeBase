/**
 * Problem Link: https://leetcode.com/problems/reverse-integer/
 * 
 * Very tricky problem, requires checking result boundary before returning.
 */

public class Solution {
    public int reverse(int x) {
        long ret = rev(x);
        if(ret > Integer.MAX_VALUE || ret < Integer.MIN_VALUE) return 0;
        return (int)ret;
    }
    
    private long rev(long x) {
        boolean flag = x < 0;
        x = x < 0 ? -x : x;
        long p = 0;
        while(x > 0) {
            p = p * 10 + x % 10;
            x /= 10;
        }
        return flag ? -p : p;
    }
}
