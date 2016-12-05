/**
 * Problem Link: https://leetcode.com/problems/sum-root-to-leaf-numbers/
 * 
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    private int sum;
    public int sumNumbers(TreeNode root) {
        sum = 0;
        sumTrav(root, 0);
        return sum;
    }
    
    private void sumTrav(TreeNode root, int s) {
        if(root == null) {
            return;
        }
        if(root.left == null && root.right == null) {
            sum += s * 10 + root.val;
            return;
        }
        sumTrav(root.left, s * 10 + root.val);
        sumTrav(root.right, s * 10 + root.val);
    }
}
