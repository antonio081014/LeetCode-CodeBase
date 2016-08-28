/**
 * Problem Link: https://leetcode.com/problems/path-sum-ii/
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
    private List<List<Integer>> list;
    public List<List<Integer>> pathSum(TreeNode root, int sum) {
        list = new ArrayList<List<Integer>>();
        pathSum(root, sum, new ArrayList<Integer>());
        return list;
    }
    
    public void pathSum(TreeNode root, int sum, List<Integer> ret) {
        if(root == null) {
            return;
        }
        ret.add(root.val);
        if(root.left == null && root.right == null && sum == root.val) {
            list.add(new ArrayList<Integer>(ret));
        } 
        pathSum(root.left, sum - root.val, ret);
        pathSum(root.right, sum - root.val, ret);
        ret.remove(ret.size()-1);
    }
}
