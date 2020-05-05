/**
 * https://leetcode.com/problems/linked-list-cycle/
 * 
 * 
 */ 
// Date: Tue May  5 13:30:25 PDT 2020
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
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head?.next
        var slow = head
        while fast != nil, fast?.next != nil {
            if fast === slow { return true }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}
