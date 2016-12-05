/**
 * Problem: https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
 * 
 * Solution: Tree Level Order Traverse.
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
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
        int curnode = 0;
        int nxtnode = 0;
        Queue<TreeNode> q = new LinkedList<TreeNode>();
        List<List<Integer>> list = new ArrayList<List<Integer>>();
        List<Integer> subList = new ArrayList<Integer>();
        if(root == null) return list;
        q.add(root);
        curnode = 1;
        while(!q.isEmpty()) {
            TreeNode node = q.poll();
            subList.add(node.val);
            curnode --;
            if(node.left != null) {
                nxtnode ++;
                q.add(node.left);
            }
            if(node.right != null) {
                nxtnode ++;
                q.add(node.right);
            }
            if(curnode == 0) {
                list.add(0, subList);
                subList = new ArrayList<Integer>();
                curnode = nxtnode;
                nxtnode = 0;
            }
        }
        return list;
    }
}
