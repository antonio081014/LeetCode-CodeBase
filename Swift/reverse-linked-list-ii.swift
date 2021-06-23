/**
 * https://leetcode.com/problems/reverse-linked-list-ii/
 * 
 * 
 */ 
// Date: Wed Jun 23 14:46:37 PDT 2021
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
    // This is a copied code.
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var pre: ListNode? = dummy
        for _ in 0..<(m - 1) {
            pre = pre?.next
        }
        
        let start: ListNode? = pre?.next
        var end: ListNode? = start?.next
        for _ in 0..<(n - m) {
            start?.next = end?.next
            end?.next = pre?.next
            pre?.next = end
            end = start?.next
        }
        
        return dummy.next
    }
}