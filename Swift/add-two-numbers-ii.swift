/**
 * https://leetcode.com/problems/add-two-numbers-ii/
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
    func addTwoNumbers(_ ll1: ListNode?, _ ll2: ListNode?) -> ListNode? {
        var l1 = ll1
        var stack1 = [Int]()
        while l1 != nil {
            stack1 += [l1!.val]
            l1 = l1!.next
        }
        var l2 = ll2
        var stack2 = [Int]()
        while l2 != nil {
            stack2 += [l2!.val]
            l2 = l2!.next
        }
        var head = ListNode(0)
        var sum = 0
        while !stack1.isEmpty || !stack2.isEmpty || sum>0 {
            if !stack1.isEmpty {
                sum += stack1.popLast()!
            }
            if !stack2.isEmpty {
                sum += stack2.popLast()!
            }
            var node = ListNode(sum % 10)
            node.next = head.next
            head.next = node
            sum /= 10
        }
        return head.next
    }
}
