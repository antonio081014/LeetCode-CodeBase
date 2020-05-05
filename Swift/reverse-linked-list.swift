/**
 * https://leetcode.com/problems/reverse-linked-list/
 * 
 * 
 */ 
// Date: Mon May  4 22:49:29 PDT 2020
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
    /// iterative way to solve this problem.
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var next = head?.next
        head?.next = nil
        while next != nil {
            let nnext = next?.next
            next?.next = head
            head = next
            next = nnext
        }
        return head
    }
}

class Solution {
    /// Recursive way to solve this problem.
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        guard var next = head?.next else { return head }
        head?.next = nil
        let rvNode = reverseList(next)
        next.next = head
        return rvNode
    }
}
