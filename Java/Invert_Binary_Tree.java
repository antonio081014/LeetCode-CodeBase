/**
 * Problem: https://leetcode.com/problems/invert-binary-tree/
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
    public TreeNode invertTree(TreeNode root) {
        if(root == null) return root;
        TreeNode tmp = root.left;
        root.left = root.right;
        root.right = tmp;
        if(root.left != null) root.left = invertTree(root.left);
        if(root.right != null) root.right = invertTree(root.right);
        return root;
    }
}
