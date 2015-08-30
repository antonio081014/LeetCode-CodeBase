/**
 * Problem: https://leetcode.com/problems/recover-binary-search-tree/
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
    public void recoverTree(TreeNode root) {
        Stack<TreeNode> swapPair = new Stack<TreeNode>();
        recoverTree(root, swapPair);
       
        if (swapPair.size() != 0) {
            TreeNode node1 = swapPair.pop();
            TreeNode node2 = swapPair.pop();
            int val = node1.val;
            node1.val = node2.val;
            node2.val = val;
        }
    }
       
    // In-order Tree Traversal.
    void recoverTree(TreeNode root, Stack<TreeNode> swapPair) {
        if (root == null) return;
        recoverTree(root.left, swapPair);
        addNodeToStack(swapPair, root);
        recoverTree(root.right, swapPair);
    }
   
    // Tricky.
    void addNodeToStack(Stack<TreeNode> swapPair, TreeNode root) {
        int sz = swapPair.size();
        if (sz == 0) {
            swapPair.push(root);
        } else if (sz == 1) {
            if (root.val >= swapPair.peek().val) {
                swapPair.pop();
            }
            swapPair.push(root);
        } else if (sz == 2) {
            if (root.val < swapPair.peek().val) {
                swapPair.pop();
                swapPair.push(root);
            }
        } 
    }
}
