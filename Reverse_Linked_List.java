/**
 * Problem: https://leetcode.com/problems/reverse-linked-list/
 * 
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public ListNode reverseList(ListNode head) {
        ListNode rev = null;
        while(head != null) {
            ListNode tail = head.next;
            head.next = rev;
            rev = head;
            head = tail;
        }
        return rev;
    }
    
    public ListNode reverseList(ListNode head) {
        return reverseList(head, null);
    }
    
    private ListNode reverseList(ListNode head, ListNode revHead) {
        if (head == null) return revHead;
        ListNode rest = head.next;
        head.next = revHead;
        return reverseList(rest, head);
    }
}
