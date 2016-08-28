/**
 * Problem: https://leetcode.com/problems/add-digits/
 * Recursively call this method until the num is smaller than 10.
 **/
public class Solution {
    public int addDigits(int num) {
        if(num < 10) return num;
        int sum = 0;
        while(num > 0) {
            sum += num % 10;
            num /= 10;
        }
        return addDigits(sum);
    }
}
