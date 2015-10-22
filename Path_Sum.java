/**
 * Problem Link: https://leetcode.com/problems/path-sum/
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
    public boolean hasPathSum(TreeNode root, int sum) {
        if(root == null) return false;
        return check(root, sum);
    }
    
    private boolean check(TreeNode root, int sum){
        if(root == null && sum == 0) return true;
        else if(root == null) return false;
        if(root.left != null && root.right == null) {
            return check(root.left, sum - root.val);
        }
        if(root.left == null && root.right != null) {
            return check(root.right, sum - root.val);
        }
        if(root.left != null && root.right != null) {
            return check(root.left, sum - root.val) || check(root.right, sum - root.val);
        }
        return sum == root.val;
    }
}
