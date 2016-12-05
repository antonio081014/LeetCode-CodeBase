import java.util.*;
/**
 * Problem: https://leetcode.com/problems/symmetric-tree/
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
    public boolean isSymmetric(TreeNode root) {
        if (root == null) return true;
        Queue<TreeNode> q = new LinkedList<TreeNode>();
        String left = "";
        if (root.left == null) left = ",#";
        else {
            q.add(root.left);
            while(!q.isEmpty()) {
                TreeNode node = q.poll();
                if(node == null) left += ",#";
                else { 
                    left += ","+node.val;
                    q.add(node.left);
                    q.add(node.right);
                }
            }
        }
        
        q.clear();
        String right = "";
        if (root.right == null) right = ",#";
        else {
            q.add(root.right);
            while(!q.isEmpty()) {
                TreeNode node = q.poll();
                if(node == null) right += ",#";
                else { 
                    right += ","+node.val;
                    q.add(node.right);
                    q.add(node.left);
                }
            }
        }
        
        return left.compareTo(right) == 0;
    }
}
