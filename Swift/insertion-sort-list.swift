/**
 * https://leetcode.com/problems/insertion-sort-list/
 * 
 * 
 */ 
// Date: Mon Nov  2 10:11:50 PST 2020
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
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let resultNode = ListNode(Int.min)
        var node = head
        // Go through the list.
        while node != nil {
            var startNode = resultNode
            // Find the spot from output list
            while startNode.next != nil && startNode.next!.val < node!.val {
                startNode = startNode.next!
            }
            // Insert it.
            let tmpNode = ListNode(node!.val, startNode.next)
            startNode.next = tmpNode
            node = node?.next
        }
        return resultNode.next
    }
}