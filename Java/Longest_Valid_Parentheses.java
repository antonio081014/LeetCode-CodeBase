public class Solution {
    public int longestValidParentheses(String s) {
        int n = s.length();
        int[] mark = new int[n+1];
        mark[0] = 0;
        int maxLen = 0;
        for(int i=1; i<=n; i++) {
            mark[i] = 0;
            if(s.charAt(i-1) == ')') {
                int j = i - 2 - mark[i-1];
                if(j >= 0 && s.charAt(j) == '(') {
                    mark[i] = mark[i-1] + mark[j] + 2;
                }
            }
            maxLen = Math.max(maxLen, mark[i]);
        }
        return maxLen;
    }
}
