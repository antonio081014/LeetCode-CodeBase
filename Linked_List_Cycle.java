/**
 * Problem Link: https://leetcode.com/problems/linked-list-cycle/
 * 
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public boolean hasCycle(ListNode head) {
        ListNode node1 = head;
        ListNode node2 = null;
        if(head != null && head.next != null) {
            node2 = head.next;
        } else {
            return false;
        }
        while(node1 != null) {
            if(node1 == node2) return true;
            node1 = node1.next;
            if(node2.next != null && node2.next.next != null) node2 = node2.next.next;
            else return false;
        }
        return false;
    }
}
