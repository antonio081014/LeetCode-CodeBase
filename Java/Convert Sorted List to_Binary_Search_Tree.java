/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
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
    public TreeNode sortedListToBST(ListNode head) {
        int count = 0;
        ListNode node = head;
        while(node != null) {
            node = node.next;
            count++;
        }
        if(count == 0) return null;
        if(count == 1) return new TreeNode(head.val);
        node = head;
        for(int i=0; i<count/2-1; i++) {
            node = node.next;
        }
        TreeNode tNode = new TreeNode(node.next.val);
        tNode.right = sortedListToBST(node.next.next);
        node.next = null;
        tNode.left = sortedListToBST(head);
        return tNode;
    }
}
