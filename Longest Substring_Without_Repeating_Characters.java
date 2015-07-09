/**
 * Problem: https://leetcode.com/problems/longest-substring-without-repeating-characters/
 * 
 * The key to solve this problem:
 * 1st, using hashtable to keep the latest index of current character.
 * 2nd, If current character is new, then...
 *      If current character is not new, then...
 * Be clear about these two questions above, problem will be solved.
 */
public class Solution {
    public int lengthOfLongestSubstring(String s) {
        if(s==null)
            return 0;
        int start = 0;
        int max = 0;
        int[] index = new int[256];
        for(int i=0; i<256; i++) index[i] = -1;
        
        for(int i=0; i<s.length(); i++) {
            char c = s.charAt(i);
            if(index[c] == -1) {
                index[c] = i;
            } else {
                max = Math.max(max, i - start);
                for(int j=start; j<i; j++) {
                    if(s.charAt(j) == c) {
                        start = j + 1;
                        break;
                    }
                    index[s.charAt(j)] = -1;
                }
            }
        }
        max = Math.max(max, s.length() - start);
        return max;
    }
}
