/**
 * Problem Link: https://leetcode.com/problems/remove-linked-list-elements/
 * 
 * Iterate every elements in the list, then remove the node with val equals to val.
 * 
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public ListNode removeElements(ListNode head, int val) {
        while(head != null && head.val == val) head = head.next;
        ListNode next = head;
        while(next != null && next.next != null) {
            if(next.next.val == val) {
                next.next = next.next.next;
            } else {
                next = next.next;
            }
        }
        return head;
    }
}
