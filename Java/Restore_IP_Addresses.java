public class Solution {
    private List<String> list;
    public List<String> restoreIpAddresses(String s) {
        list = new ArrayList<String>();
        backtrack(s, 0, 4, "");
        return list;
    }
    
    private void backtrack(String s, int k, int n, String ret) {
        if(k == s.length() && n == 0) {
            list.add(ret.substring(1));
            return;
        } else if (k == s.length()) return;
        else if(n == 0) return;
        
        for(int len=1; len<=3 && k+len<=s.length(); len++) {
            String ss = s.substring(k, k+len);
            int num = Integer.parseInt(ss);
            if((""+num).length() != len) continue;
            if(num >=0 && num<=255) {
                backtrack(s, k+len, n-1, ret + "." + num);
            }
        }
    }
}
