/**
 * Problem Link: https://leetcode.com/problems/binary-tree-maximum-path-sum/
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
    private HashMap<TreeNode, Integer> map;
    private int maxSum;
    public int maxPathSum(TreeNode root) {
        map = new HashMap<TreeNode, Integer>();
        maxSum = Integer.MIN_VALUE;
        pathSum(root);
        return maxSum;
    }
    
    private void pathSum(TreeNode root) {
        if(root == null) return;
        pathSum(root.left);
        pathSum(root.right);
        
        map.put(root, root.val);
        // Just root itself;
        if(root.left == null && root.right == null) {
            map.put(root, root.val);
        } 
        // root itself or with left branch.
        else if(root.left != null && root.right == null) {
            int left = map.get(root.left);
            if(left > 0) map.put(root, left + root.val);
        }
        // root itself or with right branch.
        else if(root.left == null && root.right != null) {
            int right = map.get(root.right);
            if(right > 0) map.put(root, right + root.val);
        }
        // root itsel, with left branch only, with right branch only, with both branches.
        else {
            int left = map.get(root.left);
            int right = map.get(root.right);
            if(Math.max(left, right) > 0) map.put(root, Math.max(left, right) + root.val);
            maxSum = Math.max(maxSum, left + right + root.val);
        }
        maxSum = Math.max(maxSum, map.get(root));
    }
}
