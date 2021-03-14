/**
 * https://leetcode.com/problems/swapping-nodes-in-a-linked-list/
 * 
 * 
 */ 
// Date: Sun Mar 14 13:05:17 PDT 2021
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
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var kthNodeStart: ListNode? = nil
        var gap = 0
        var fast = head
        var slow = head
        while fast != nil {
            gap += 1
            if gap == k {
                kthNodeStart = fast
            }
            if gap > k {
                slow = slow?.next
            }
            fast = fast?.next
        }
        let v = kthNodeStart?.val ?? -1
        kthNodeStart?.val = slow?.val ?? -1
        slow?.val = v
        return head
    }
}