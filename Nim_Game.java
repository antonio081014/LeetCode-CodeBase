/**
 * Problem Link: https://leetcode.com/problems/nim-game/
 * 
 * When n∈[1,3]，Win.
 * 
 * When n == 4，Lose.
 * 
 * When n∈[5,7]，Win.
 * 
 * When n == 8, Lose.
 * 
 * So, whenever n % 4 == 0, Fail.
 */
 
public class Solution {
    public boolean canWinNim(int n) {
        return n % 4 != 0;
    }
}
