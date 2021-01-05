/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
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
    ///
    /// - Complexity:
    ///     - Time: O(n), n is the number of ListNode instances in linked by head, inclusive.
    ///     - Space: O(1), only use node and preNode here, everything else is in place.
    ///
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let root = ListNode(0)
        root.next = head
        var node = head
        var preNode: ListNode? = root
        while node != nil {
            var flag = false
            while node?.next != nil, node?.val == node?.next?.val {
                node = node?.next
                flag = true
            }
            
            if flag == false {
                preNode = preNode?.next
            } else {
                preNode?.next = node?.next
            }
            node = node?.next
        }
        return root.next
    }
}
/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
 * 
 * 
 */ 
// Date: Tue Jan  5 09:56:18 PST 2021
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let root = ListNode(0)
        root.next = head
        var node = head
        var preNode: ListNode? = root
        while node != nil {
            var dups = false
            while node?.next != nil, node?.val == node?.next?.val {
                node = node?.next
                dups = true
            }
            if dups {
                preNode?.next = node?.next
            } else {
                preNode = preNode?.next
            }
            node = node?.next
        }
        return root.next
    }
}