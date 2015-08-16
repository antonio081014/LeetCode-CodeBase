/**
 * Problem : https://leetcode.com/problems/swap-nodes-in-pairs/
 * 
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public ListNode swapPairs(ListNode head) {
        if(head == null) return head;
        ListNode root = new ListNode(0);
        ListNode next = root;
        do {
            ListNode node1 = head;
            ListNode node2 = head.next;
            if(node1 == null || node2 == null) {
                next.next = node1;
                break;
            }
            node1.next = node2.next;
            node2.next = node1;
            next.next = node2;
            head = head.next;
            next = next.next.next;
        }while(head != null);
        return root.next;
    }
}
