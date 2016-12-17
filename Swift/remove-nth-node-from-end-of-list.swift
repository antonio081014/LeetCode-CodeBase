/**
 * Problem Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let root:ListNode? = ListNode(0)
        root?.next = head
        var slow = root
        var fast = root
        for _ in 0..<n {
            fast = fast?.next
        }
        while let next = fast?.next {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return root?.next
    }
}
