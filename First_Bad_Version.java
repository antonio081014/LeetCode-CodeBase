/**
 * Problem: https://leetcode.com/problems/first-bad-version/ 
 * Binary Search to find the first one which isBadVersion(x) is true.
 * 
 * Reference: https://www.topcoder.com/community/data-science/data-science-tutorials/binary-search/
 */
 
/* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        int left = 1;
        int right = n;
        while(left < right) {
            int mid = left + (right - left) / 2;
            if(isBadVersion(mid)) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        return left;
    }
}
