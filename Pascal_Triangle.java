/**
 * Problem Link: https://leetcode.com/problems/pascals-triangle/
 */
public class Solution {
    public List<List<Integer>> generate(int n) {
        List<List<Integer>> list = new ArrayList<List<Integer>>();
        if(n == 0) return list;
        List<Integer> tmp = new ArrayList<Integer>();
        int[][] cand = new int[2][n];
        cand[0][0] = 1;
        tmp.add(1);
        list.add(new ArrayList<Integer>(tmp));
        for(int i=1; i<n; i++) {
            tmp.clear();
            int x = i % 2;
            for(int j=0; j<=i; j++) {
                cand[x][j] = cand[(x+1) % 2][j];
                if(j > 0) cand[x][j] += cand[(x+1) % 2][j-1];
                tmp.add(cand[x][j]);
            }
            list.add(new ArrayList<Integer>(tmp));
        }
        return list;
    }
}
