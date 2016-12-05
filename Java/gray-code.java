/**
 * Problem Link: https://leetcode.com/problems/gray-code/
 * 
 * Iterate every code, generate next code based on current(latest) code.
 */
public class Solution {
    private HashSet<Integer> set;
    private List<Integer> list;
    
    public List<Integer> grayCode(int n) {
        set = new HashSet<Integer>();
        list = new ArrayList<Integer>();
        set.add(0);
        list.add(0);
        next(0, n);
        return list;
    }
    
    private void next(int last, int n) {
        for(int i=0; i<n; i++) {
            int bit = 1 & (last >> i);
            int ret = last;
            if(bit == 0) {
                ret += (1 << i);
            }
            else {
                ret -= (1 << i);
            }
            //System.out.println(ret);
            Integer r = Integer.valueOf(ret);
            if(!set.contains(r)) {
                list.add(r);
                set.add(r);
                next(ret, n);
            }
        }
    }
}
