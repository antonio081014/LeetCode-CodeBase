/**
 * Problem: https://leetcode.com/problems/search-a-2d-matrix-ii/
 * 
 * Search from bottom left to top right. 
 * Since strictly ascending in any row or column,
 * use current position(r, c) as the bottom right boundary of the matrix search.
 * 
 */

public class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int m = matrix.length;
        int n = matrix[0].length;
        
        int r = m-1;
        int c = 0;
        while(r >= 0 && c < n) {
            if(matrix[r][c] == target) return true;
            else if(target > matrix[r][c]) {
                c++;
            } else {
                r--;
            }
        }
        return false;
    }
}
