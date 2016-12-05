/**
 * Problem: https://leetcode.com/problems/binary-tree-paths/
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
    private List<String> list;
    public List<String> binaryTreePaths(TreeNode root) {
        list = new ArrayList<String>();
        if(root == null) return list;
        traverse(root, "");
        return list;
    }
    
    private void traverse(TreeNode root, String s) {
        s += "->" + root.val;
        if(root.left == null && root.right == null) {
            list.add(s.substring(2));
            return;
        } 
        if(root.left != null) {
            traverse(root.left, s);
        }
        if(root.right != null) {
            traverse(root.right, s);
        }
    }
}
