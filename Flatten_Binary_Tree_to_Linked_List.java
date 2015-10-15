/**
 * Problem Link: https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
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
    public void flatten(TreeNode root) {
        if(root == null) return;
        Stack<TreeNode> stack = new Stack<TreeNode>();
        TreeNode r = new TreeNode(0);
        TreeNode next = r;
        stack.push(root);
        while(stack.empty() == false) {
            TreeNode node = stack.pop();
            if(node.right != null) stack.push(node.right);
            if(node.left != null) stack.push(node.left);
            
            next.right = node;
            next.left = null;
            next = next.right;
            
        }
        root = r.right;
    }
}
