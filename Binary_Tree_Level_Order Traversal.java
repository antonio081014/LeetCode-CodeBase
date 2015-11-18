/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>> list = new ArrayList<List<Integer>>();
        if(root == null) return list;
        Queue<TreeNode> q = new LinkedList<TreeNode>();
        q.add(root);
        int cur = 1;
        int nxt = 0;
        List<Integer> tmp = new ArrayList<Integer>();
        while(!q.isEmpty()) {
            TreeNode node = q.poll();
            cur--;
            tmp.add(node.val);
            if(node.left != null) {
                q.add(node.left);
                nxt++;
            }
            if(node.right != null) {
                q.add(node.right);
                nxt++;
            }
            if(cur == 0) {
                list.add(new ArrayList<Integer>(tmp));
                cur = nxt;
                nxt = 0;
                tmp.clear();
            }
        }
        return list;
    }
}
