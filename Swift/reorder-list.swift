/**
 * https://leetcode.com/problems/reorder-list/
 * 
 * 
 */ 
// Date: Thu Aug 20 14:13:46 PDT 2020
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
    func reorderList(_ head: ListNode?) {
        var list = [ListNode]()
        var node: ListNode? = head
        while let aNode = node {
            list.append(aNode)
            node = aNode.next
        }
        var result = [ListNode]()
        var flag = true
        while list.isEmpty == false {
            let node = flag ? list.removeFirst() : list.removeLast()
            node.next = nil
            // print("\(node.val)")
            result.append(node)
            if result.count > 1 {
                result[result.count - 2].next = result[result.count - 1]
            }
            flag = !flag
        }
    }
}


class Solution {
    func reorderList(_ head: ListNode?) {
        var list = [ListNode]()
        var node: ListNode? = head
        while let aNode = node {
            list.append(aNode)
            node = aNode.next
            aNode.next = nil
        }
        var flag = true
        node = ListNode(0)
        var index1 = 0
        var index2 = list.count - 1
        while index1 <= index2 {
            node?.next = list[index1]
            node = node?.next
            if index1 != index2 {
                node?.next = list[index2]
                node = node?.next
            }
            index2 -= 1
            index1 += 1
        }
    }
}