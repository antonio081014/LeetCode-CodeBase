/**
 * https://leetcode.com/problems/middle-of-the-linked-list/
 * 
 * 
 */ 
/**
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
    /// Run through the list, count the number of total nodes in the list.
    /// Then, take a second run, stop at middle point of the list.
    /// - Complexity:
    ///     - Time: O(n), n is the number of element in the list.
    ///     - Space: O(1).
    ///
    func middleNode(_ head: ListNode?) -> ListNode? {
        var count = 0
        var node = head
        while node != nil {
            count += 1
            node = node?.next
        }
        count /= 2
        node = head
        while count > 0 {
            node = node?.next
            count -= 1
        }
        return node
    }
}

/**
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
    /// This solution uses two pointers, one slow, one fast.
    /// The change pace of fast is twice as fast as slow pointer.
    /// So, when fast would move beyond the tail of list, both stops there.
    /// Thus, the slow pointer is the place where answer should be.
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while slow != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
