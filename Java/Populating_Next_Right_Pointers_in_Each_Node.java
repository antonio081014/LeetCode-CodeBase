/**
 * Problem Link: https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
 * Binary Tree Level Traverse.
 * Definition for binary tree with next pointer.
 * public class TreeLinkNode {
 *     int val;
 *     TreeLinkNode left, right, next;
 *     TreeLinkNode(int x) { val = x; }
 * }
 */
public class Solution {
    public void connect(TreeLinkNode root) {
        if(root == null) return;
        Queue<TreeLinkNode> q = new LinkedList<TreeLinkNode>();
        q.offer(root);
        int cur = 1;
        int nxt = 0;
        while(!q.isEmpty()) {
            TreeLinkNode node = q.poll();
            cur--;
            if(node.left != null) {
                q.offer(node.left);
                nxt++;
            }
            if(node.right != null) {
                q.offer(node.right);
                nxt++;
            }
            if(cur == 0) {
                node.next = null;
                cur = nxt;
                nxt = 0;
            } else {
                node.next = q.peek();
            }
        }
    }
}
