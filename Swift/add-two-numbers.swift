/**
 * Problem Link: https://leetcode.com/problems/add-two-numbers/
 *
 *
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var bit = 0
        let head = ListNode(0)
        var tail = head
        var ll1 = l1
        var ll2 = l2
        while ll1 != nil || ll2 != nil || bit > 0{
            var sum = bit
            if let x = ll1 {
                sum += x.val
                ll1 = x.next
            }
            if let y = ll2 {
                sum += y.val
                ll2 = y.next
            }
            tail.next = ListNode(sum % 10)
            bit = sum / 10
            tail = tail.next!
        }
        return head.next
    }
}

// Wed Mar 25 14:16:12 PDT 2020
class Solution {
    ///
    /// - Complexity: O(max(L1, L2)), where L1 is the length of l1, L2 is the length of l2.
    ///
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let root = ListNode(0)
        var parent: ListNode? = root
        var ll1 = l1
        var ll2 = l2
        var sum = 0
        while ll1 != nil || ll2 != nil || sum > 0 {
            sum += ll1?.val ?? 0
            sum += ll2?.val ?? 0
            ll1 = ll1?.next
            ll2 = ll2?.next
            parent?.next = ListNode(sum % 10)
            parent = parent?.next
            sum /= 10
        }
        return root.next
    }
}
