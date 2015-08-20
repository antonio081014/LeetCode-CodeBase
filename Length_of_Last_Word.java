/**
 * Problem: https://leetcode.com/problems/length-of-last-word/
 * 
 */
public class Solution {
    public int lengthOfLastWord(String s) {
        int len = 0;
        s = s.trim();
        for(int i=s.length() - 1; i>=0; i--){
            if(s.charAt(i) == ' ') {
                break;
            } else {
                len++;
            }
        }
        return len;
    }
}
