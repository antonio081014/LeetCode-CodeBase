/**
 * https://leetcode.com/problems/sort-list/
 * 
 * 
 */ 
// Date: Tue Oct 13 08:21:05 PDT 2020
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
    /// - Complexity:
    ///     - Time: O(nlogn), linear time to construct array, 
    ///                     then, O(nlogn) to sort.
    ///     - Space: O(n), linear space as an array.
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var list = [ListNode]()
        var node = head
        while let next = node.next {
            node.next = nil
            list.append(node)
            node = next
        }
        list.append(node)
        list.sort(by: { $0.val < $1.val } )
        for index in stride(from: 1, to: list.count, by: 1) {
            list[index - 1].next = list[index]
        }
        return list.first
    }
}/**
 * https://leetcode.com/problems/sort-list/
 * 
 * 
 */ 
// Date: Tue Oct 13 08:38:56 PDT 2020
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
    /// - Complexity:
    ///     - Time: O(nlogn)
    ///     - Space: O(1)
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        var fast = head
        var slow = head
        var prev = head
        while fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil
        let h1 = sortList(head)
        let h2 = sortList(slow)
        return merge(h1, h2)
    }
    
    /// - Complexity:
    ///     - Time: O(n)
    ///     - Space: O(1)
    private func merge(_ h1: ListNode?, _ h2: ListNode?) -> ListNode? {
        var head = ListNode()
        var node = head
        var l1 = h1
        var l2 = h2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                node.next = ListNode(l1!.val)
                l1 = l1?.next
            } else {
                node.next = ListNode(l2!.val)
                l2 = l2?.next
            }
            node = node.next!
        }
        node.next = l1 == nil ? l2 : l1
        return head.next
    }
}