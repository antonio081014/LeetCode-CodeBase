/**
 * https://leetcode.com/problems/partition-list/
 * 
 * 
 */ 
// Date: Wed Jul 22 16:11:48 PDT 2020
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
    /// Go through list, append each node to 
    ///     smallHead, if val in current node is smaller than target x.
    ///     largeHead, if val in current node is larger than target x. 
    ///  At last, combine these two lists, and return the final combined list.
    /// - Complexity:
    ///     - Time: O(n), n is the number of elements in list.
    ///     - Space: O(n), n is the number of elements in list.
    ///
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let smallHead = ListNode()
        let largeHead = ListNode()
        var head = head
        var snode = smallHead
        var lnode = largeHead
        while let node = head {
            if node.val >= x {
                lnode.next = node
                lnode = node
            } else {
                snode.next = node
                snode = node
            }
            head = node.next
        }
        snode.next = largeHead.next
        lnode.next = nil
        return smallHead.next
    }
}
/**
 * https://leetcode.com/problems/partition-list/
 * 
 * 
 */ 
// Date: Wed Apr 14 15:09:33 PDT 2021
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let result1 = ListNode()
        let result2 = ListNode()
        var node = head
        var smallNode = result1
        var largeNode = result2
        while node != nil {
            if node!.val < x {
                smallNode.next = ListNode(node!.val)
                smallNode = smallNode.next!
            } else {
                largeNode.next = ListNode(node!.val)
                largeNode = largeNode.next!
            }
            node = node?.next
        }
        smallNode.next = result2.next
        return result1.next
    }
}