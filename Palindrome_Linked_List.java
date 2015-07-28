/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */

public class Solution {
    public boolean isPalindrome(ListNode head) {
        ListNode root = head;
        ListNode list1 = reverseLink(root);
        ListNode list2 = root;
    
        while(list1 != null && list2 != null) {
            if(list1.val != list2.val) return false;
            list1 = list1.next;
            list2 = list2.next;
        }
        return list1 == null && list2 == null;
    }
    
    private ListNode reverseLink(ListNode head) {
        ListNode ret = null;
        while(head != null) {
            ListNode tmp = new ListNode(head.val);
            tmp.next = ret;
            ret = tmp;
            head = head.next;
        }
        return ret;
    }
}
