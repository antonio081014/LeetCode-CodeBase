/**
 * Problem Link: https://leetcode.com/problems/longest-common-prefix/
 */
public class Solution {
    public String longestCommonPrefix(String[] strs) {
        if(strs.length == 0) return "";
        int len = 0;
        while(len < strs[0].length()) {
            char c = strs[0].charAt(len);
            for(int i=0; i<strs.length; i++) {
                if(len >= strs[i].length() || c != strs[i].charAt(len)) {
                    return strs[0].substring(0, len);
                }
            }
            len ++;
        }
        return strs[0].substring(0, len);
    }
}
