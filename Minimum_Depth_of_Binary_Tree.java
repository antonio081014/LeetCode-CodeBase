/**
 * Problem: https://leetcode.com/problems/minimum-depth-of-binary-tree/
 * 
 * Solution: Recursively Find the depth of the tree. 
 * PS: Only leaf node could be considered as the end of the tree branch.
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    public int minDepth(TreeNode root) {
        if (root == null) return 0;
        if(root.left == null && root.right == null) return 1;
        if(root.left == null) return 1 + minDepth(root.right);
        if(root.right == null) return 1 + minDepth(root.left);
        return 1 + Math.min(minDepth(root.left), minDepth(root.right));
    }
}
