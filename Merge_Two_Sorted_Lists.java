/**
 * Problem: https://leetcode.com/problems/merge-two-sorted-lists/
 * 
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode root = new ListNode(0);
        ListNode next = root;
        while(l1 != null || l2 != null) {
            if(l1 != null && l2 != null) {
                if(l1.val < l2.val) {
                    next.next = new ListNode(l1.val);
                    l1 = l1.next;
                } else {
                    next.next = new ListNode(l2.val);
                    l2 = l2.next;
                }
            } else if(l1 != null) {
                next.next = new ListNode(l1.val);
                l1 = l1.next;
            } else {
                next.next = new ListNode(l2.val);
                l2 = l2.next;
            }
            next = next.next;
        }
        return root.next;
    }
}
