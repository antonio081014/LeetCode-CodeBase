/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
public class Solution {
    public ListNode reverseKGroup(ListNode head, int k) {
        ListNode ret = new ListNode(0);
        ListNode next = ret;
        while(head != null) {
            ListNode tmp = reverseLink(head, k);
            if(tmp == null) {
                next.next = head;
                break;
            }
            next.next = tmp;
            for(int i=0; i<k; i++) {
                next = next.next;
                head = head.next;
            }
        }
        return ret.next;
    }
    
    private ListNode reverseLink(ListNode head, int k) {
        ListNode ret = null;
        while(head != null && k > 0) {
            ListNode tmp = new ListNode(head.val);
            tmp.next = ret;
            ret = tmp;
            head = head.next;
            k--;
        }
        return k == 0 ? ret : null;
    }
}
