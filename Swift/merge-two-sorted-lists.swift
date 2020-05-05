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
/**
 * https://leetcode.com/problems/merge-two-sorted-lists/
 * 
 * 
 */ 
// Date: Mon May  4 22:54:09 PDT 2020
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var head = ListNode()
        var node = head
        while l1 != nil || l2 != nil {
            if l1 != nil, l2 != nil {
                if l1!.val <= l2!.val {
                    node.next = ListNode(l1!.val)
                    l1 = l1?.next
                } else {
                    node.next = ListNode(l2!.val)
                    l2 = l2?.next
                }
            } else if l1 != nil {
                node.next = ListNode(l1!.val)
                l1 = l1?.next
            } else if l2 != nil {
                node.next = ListNode(l2!.val)
                l2 = l2?.next
            }
            node = node.next!
        }
        return head.next
    }
}
