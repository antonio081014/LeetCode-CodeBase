/**
 * Problem: https://leetcode.com/problems/h-index/
 */

public class Solution {
    public int hIndex(int[] citations) {
        Arrays.sort(citations);
        int h = 0;
        int i = 0;
        for(i=citations.length-1; i>=0; i--){
            if(citations[i] <= h || citations[i] == 0) break;
            h++;
        }
        
        return h;
    }
}
