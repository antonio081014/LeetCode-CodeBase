/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-list/
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var root = ListNode(0)
        var parent = root
        var current = head
        var seen: Set<Int> = []
        while current != nil {
            if !seen.contains(current!.val) {
                seen.insert(current!.val)
                parent.next = current!
                parent = current!
            }
            current = current?.next
        }
        parent.next = nil
        return root.next
    }
}