/**
 * https://leetcode.com/problems/delete-node-in-a-linked-list/
 * 
 * 
 */ 
// Date: Mon May  4 21:59:03 PDT 2020
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
    func deleteNode(_ node: ListNode?) {
        var node = node
        while let next = node?.next {
            node?.val = next.val
            if next.next == nil {
                node?.next = nil
            }
            node = next
        }
        node = nil
    }
}

class Solution {
    func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }
}
