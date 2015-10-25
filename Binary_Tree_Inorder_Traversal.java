/**
 * Problem Link: https://leetcode.com/problems/binary-tree-inorder-traversal/
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
    public List<Integer> inorderTraversal(TreeNode root) {
        HashSet<TreeNode> visited = new HashSet<TreeNode>();
        Stack<TreeNode> stack = new Stack<TreeNode>();
        List<Integer> list = new ArrayList<Integer>();
        if(root == null) return list;
        stack.push(root);
        while(!stack.empty()) {
            TreeNode node = stack.peek();
            if(node.left != null && !visited.contains(node.left)) {
                stack.push(node.left);
            } else {
                node = stack.pop();
                list.add(node.val);
                visited.add(node);
                if(node.right != null) stack.push(node.right);
            }
        }
        return list;
    }
    
    public List<Integer> inorderTraversal(TreeNode root) {
        HashSet<TreeNode> visited = new HashSet<TreeNode>();
        Stack<TreeNode> stack = new Stack<TreeNode>();
        List<Integer> list = new ArrayList<Integer>();
        if(root == null) return list;
        stack.push(root);
        while(!stack.empty()) {
            TreeNode node = stack.peek();
            if(node.left != null) {
                if(visited.contains(node.left)) {
                    node = stack.pop();
                    list.add(node.val);
                    visited.add(node);
                    if(node.right != null) stack.push(node.right);
                } else {
                    if(node.left != null) {
                        stack.push(node.left);
                    } else {
                        node = stack.pop();
                        list.add(node.val);
                        visited.add(node);
                        if(node.right != null) stack.push(node.right);
                    }
                }
            } else {
                node = stack.pop();
                list.add(node.val);
                visited.add(node);
                if(node.right != null) stack.push(node.right);
            }
        }
        return list;
    }
}
