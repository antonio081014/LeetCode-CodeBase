/**
 * Problem Link: https://leetcode.com/problems/merge-two-sorted-lists/
 *
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var node = head
        var ll1 = l1
        var ll2 = l2
        while ll1 != nil || ll2 != nil {
            if ll1 != nil && ll2 != nil {
                if ll1!.val <= ll2!.val {
                    node.next = ListNode(ll1!.val)
                    ll1 = ll1!.next
                } else {
                    node.next = ListNode(ll2!.val)
                    ll2 = ll2!.next
                }
            } else if ll1 != nil {
                node.next = ListNode(ll1!.val)
                ll1 = ll1!.next
            } else {
                node.next = ListNode(ll2!.val)
                ll2 = ll2!.next
            }
            node = node.next!
        }
        return head.next
    }
}
