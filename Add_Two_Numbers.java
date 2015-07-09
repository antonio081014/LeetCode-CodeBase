/**
 * Problem: https://leetcode.com/problems/add-two-numbers/
 * 
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode head = new ListNode((l1.val + l2.val) % 10);
        int bit = (l1.val + l2.val) / 10;
        ListNode node1 = l1.next;
        ListNode node2 = l2.next;
        ListNode next = head;
        while(node1 != null || node2 != null || bit > 0) {
            if(node1 != null) {
                bit += node1.val;
                node1 = node1.next;
            }
            if(node2 != null) {
                bit += node2.val;
                node2 = node2.next;
            }
            next.next = new ListNode(bit % 10);
            next = next.next;
            bit /= 10;
        }
        return head;
    }
}
