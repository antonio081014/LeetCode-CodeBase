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
    
    // Less space but the same time complexity.
    // Both are linear. O(N), N is the max length of two.
    func addTwoNumbers(_ ll1: ListNode?, _ ll2: ListNode?) -> ListNode? {
        var l1 = ll1
        var c1 = 0
        while l1 != nil {
            l1 = l1!.next
            c1 += 1
        }
        var l2 = ll2
        var c2 = 0
        while l2 != nil {
            l2 = l2!.next
            c2 += 1
        }
        var cmax = max(c1, c2)
        l1 = ll1
        l2 = ll2
        var stack = [Int]()
        while cmax>0  {
            var sum = 0
            if cmax==c1, c1>0 {
                sum += l1!.val
                c1-=1
                l1 = l1!.next
            }
            if cmax==c2, c2>0 {
                sum += l2!.val
                c2-=1
                l2 = l2!.next
            }
            cmax -= 1
            stack += [sum]
        }
        var head = ListNode(0)
        var flag = 0
        while !stack.isEmpty || flag>0 {
            if stack.count > 0 {
                flag += stack.popLast()!
            }
            var node = ListNode(flag%10)
            node.next = head.next
            head.next = node
            flag /= 10
        }
        return head.next
    }
}
