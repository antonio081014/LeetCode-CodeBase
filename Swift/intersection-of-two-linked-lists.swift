/**
 * https://leetcode.com/problems/intersection-of-two-linked-lists/
 * 
 * 
 */ 
// Date: Wed Jul  8 11:31:44 PDT 2020
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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var stackA: [ListNode] = []
        var stackB: [ListNode] = []
        var node = headA
        while node != nil {
            stackA.append(node!)
            node = node?.next
        }
        node = headB
        while node != nil {
            stackB.append(node!)
            node = node?.next
        }
        
        var last: ListNode? = nil
        while stackA.isEmpty == false && stackB.isEmpty == false {
            if stackA.last! === stackB.last! {
                last = stackA.last
            } else {
                break
            }
            stackA.removeLast()
            stackB.removeLast()
        }
        
        return last
    }
}
