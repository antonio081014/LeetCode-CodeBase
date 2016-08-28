/**
 * Problem: https://leetcode.com/problems/h-index-ii/
 */

public class Solution {
    public int hIndex(int[] citations) {
        if(citations.length == 0) return 0;
        int left = 0;
        int right = citations.length - 1;
        while(left <= right) {
            int mid = (left + right) / 2;
            if(citations[mid] >= citations.length - mid) right =mid-1;
            else left = mid + 1;
        }
        return citations.length - left;
    }
}
