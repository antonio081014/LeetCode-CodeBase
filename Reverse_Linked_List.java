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
}
