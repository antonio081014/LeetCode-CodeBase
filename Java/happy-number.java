/**
 * Problem: https://leetcode.com/problems/happy-number/
 */

public class Solution {
    public boolean isHappy(int n) {
        return isHappy(n, new HashSet<Integer>());
    }
    
    private boolean isHappy(int n, HashSet<Integer> set) {
        if(set.contains(n)) return false;
        if(n == 1) return true;
        set.add(n);
        int sum = 0;
        while(n > 0) {
            sum += (n%10) * (n%10);
            n /= 10;
        }
        return isHappy(sum, set);
    }
}
