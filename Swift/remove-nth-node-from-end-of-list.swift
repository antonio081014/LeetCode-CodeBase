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
/**
 * https://leetcode.com/problems/remove-nth-node-from-end-of-list/
 * 
 * 
 */ 
// Date: Mon May  4 22:13:34 PDT 2020
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var root = ListNode(0)
        root.next = head
        var fast: ListNode? = root
        var slow: ListNode? = root
        var count = 0
        while fast?.next != nil {
            fast = fast?.next
            count += 1
            if count > n {
                slow = slow?.next
            }
        }
        if let next = slow?.next?.next {
            slow?.next = next
        } else {
            slow?.next = nil
        }
        return root.next
    }
}
