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
