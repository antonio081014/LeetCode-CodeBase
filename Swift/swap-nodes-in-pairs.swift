/**
 * https://leetcode.com/problems/swap-nodes-in-pairs/
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let root = ListNode(0)
        root.next = head
        var node = root
        while let l1 = node.next, let l2 = l1.next {
            l1.next = l2.next
            l2.next = l1
            node.next = l2
            node = l1
        }
        return root.next
    }
}
