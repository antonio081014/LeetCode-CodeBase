public class Solution {
    public boolean isMatch(String s, String p) {
        int i = 0;
        int j = 0;
        int star = -1;
        int mark = -1;
        while (i < s.length()) {
            if (j < p.length()
                && (p.charAt(j) == '?' || p.charAt(j) == s.charAt(i))) {
                ++i;
                ++j;
            } else if (j < p.length() && p.charAt(j) == '*') {
                star = j;
                j++;
                mark = i;
            } else if (star != -1) {
                j = star + 1;
                i = ++mark;
            } else {
                return false;
            }
        }
        //最后在此处处理多余的‘＊’，因为多个‘＊’和一个‘＊’意义相同。
        while (j < p.length() && p.charAt(j) == '*') {
            ++j;
        }
        return j == p.length();
    }
    
    
    /**
     * Time Limit Exceed, when using Recursion.
     *
     */
    public boolean isMatch2(String s, String p) {
        return matching(s, 0, p, 0);
    }
    
    private boolean matching(String s, int si, String p, int pi) {
        if(si == s.length() && pi == p.length()) return true;
        else if(si >= s.length() || pi >= p.length()) return false;
        
        if(p.charAt(pi) == '?') return matching(s, si+1, p, pi+1);
        if(p.charAt(pi) == '*') {
            for(int x = 1; x + si <= s.length() && s.length() - si -x >= p.length() - pi - 1; x++) {
                if(matching(s, si + x, p, pi + 1)) return true;
            }
            return false;
        }
        if(s.charAt(si) == p.charAt(pi)) return matching(s, si+1, p, pi+1);
        return false;
        
    }
}
