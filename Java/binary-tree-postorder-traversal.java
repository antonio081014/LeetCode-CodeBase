import java.util.*;
/**
 * Problem: https://leetcode.com/problems/binary-tree-postorder-traversal/
 * 
 * Problem Solved by using Recursive and Iterative solution.
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
    public List<Integer> postorderTraversal(TreeNode root) {
        List<Integer> list = new LinkedList<Integer>();
        if(root == null) return list;
        if(root.left != null) list.addAll(postorderTraversal(root.left));
        if(root.right != null) list.addAll(postorderTraversal(root.right));
        list.add(root.val);
        return list;
    }
    
    public List<Integer> postorderTraversal(TreeNode root) {
        List<Integer> list = new LinkedList<Integer>();
        
        Stack<TreeNode> stack = new Stack<TreeNode>();
        TreeNode lastVisited = null;
        
        while(root != null || !stack.empty()) {
            if(root != null) {
                stack.push(root);
                root = root.left;
            } else {
                TreeNode peekNode = stack.peek();
                if(peekNode.right != null && peekNode.right != lastVisited) {
                    root = peekNode.right;
                } else {
                    list.add(peekNode.val);
                    lastVisited = stack.pop();
                    root = null;
                }
            }
        }
        
        return list;
    }
    
    // Non-Recursive solution.
    public List<Integer> postorderTraversal(TreeNode root) {
        List<Integer> list = new ArrayList<Integer>();
        if(root == null) return list;
        Stack<TreeNode> stack = new Stack<TreeNode>();
        stack.push(root);
        TreeNode prev = null;
        while(!stack.empty()) {
            TreeNode curr = stack.peek();
            if(prev == null || prev.left == curr || prev.right == curr) {
                if(curr.left != null) {
                    stack.push(curr.left);
                } else if (curr.right != null) {
                    stack.push(curr.right);
                } else {
                    list.add(curr.val);
                    stack.pop();
                }
            } else if (curr.left == prev) {
                if(curr.right != null) {
                    stack.push(curr.right);
                } else {
                    list.add(curr.val);
                    stack.pop();
                }
            } else if (curr.right == prev) {
                list.add(curr.val);
                stack.pop();
            }
            prev = curr;
        }
        return list;
    }
}
