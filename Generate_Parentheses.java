public class Solution {
    
    private List<String> list;
    public List<String> generateParenthesis(int n) {
        list = new ArrayList<String>();
        backtrack(n, 0, 0, "");
        return list;
    }
    
    private void backtrack(int n, int left, int right, String ret) {
        if(n == left && n == right) {
            list.add(ret);
            return;
        }
        
        if(left < n)
            backtrack(n, left + 1, right, ret+"(");
        if(left > right)
            backtrack(n, left, right+1, ret+")");
    }
}
