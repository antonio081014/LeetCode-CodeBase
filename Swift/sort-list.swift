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
}