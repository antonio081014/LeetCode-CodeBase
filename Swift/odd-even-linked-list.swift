/**
 * https://leetcode.com/problems/odd-even-linked-list/
 * 
 * 
 */ 
// Date: Sun May 17 14:31:14 PDT 2020
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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let evenHead = ListNode()
        let oddHead = ListNode()
        var enode = evenHead
        var onode = oddHead
        var node = head
        var isEven = true
        while node != nil {
            // print("node: \(node?.val)")
            if isEven {
                enode.next = node
                enode = node!
            } else {
                onode.next = node
                onode = node!
            }
            node = node?.next
            isEven = !isEven
        }
        enode.next = oddHead.next
        onode.next = nil
        return evenHead.next
    }
}
/**
 * https://leetcode.com/problems/odd-even-linked-list/
 * 
 * 
 */ 
// Date: Thu Dec  2 00:19:06 PST 2021
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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var oddHead: ListNode? = ListNode(0)
        var evenHead: ListNode? = ListNode(0)
        
        var oNode = oddHead
        var eNode = evenHead
        var cNode = head
        var counter = 0
        while let node = cNode {
            if counter % 2 != 0 {
                eNode?.next = node
                eNode = eNode?.next
            } else {
                oNode?.next = node
                oNode = oNode?.next
            }
            cNode = node.next
            counter += 1
        }
        oNode?.next = evenHead?.next
        eNode?.next = nil
        return oddHead?.next
    }
}