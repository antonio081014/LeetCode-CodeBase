/**
 * https://leetcode.com/problems/rotate-list/
 * 
 * 
 */ 
// Date: Wed Oct  7 10:29:29 PDT 2020
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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head
        var count = 0
        while node != nil {
            count += 1
            node = node?.next
        }
        if count == 0 { return head }
        let k = k % count
        node = head
        var root = head
        var c = 0
        while let next = node?.next {
            c += 1
            if c > k {
                root = root?.next
            }
            node = next
        }
        let result = root?.next
        if result == nil { return head }
        root?.next = nil
        node?.next = head
        return result
    }
}