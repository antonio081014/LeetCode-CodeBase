/**
 *
 * Problem: https://leetcode.com/problems/search-a-2d-matrix/
 * 
 * Binary Search since this 2D matrix could be seen as an ordered one dimension array.
 */

public class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        if(matrix==null || matrix.length==0 || matrix[0].length==0) 
            return false;
        int m = matrix.length;
        int n = matrix[0].length;
        int left = 0;
        int right = m * n - 1;
        
        while(left <= right) {
            int mid = (left + right) / 2;
            int x = mid / n;
            int y = mid % n;
            
            if(target == matrix[x][y]) return true;
            if(target > matrix[x][y]) left = mid + 1;
            else right = mid - 1;
        }
        return false;
    }
}
