/**
 * https://leetcode.com/problems/linked-list-random-node/
 * 
 * 
 */ 
// Date: Wed Dec  2 10:45:05 PST 2020
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

    // Store the LinkedList in an array.
    /// - Complexity:
    ///     - Time: O(n), n is the count of LinkedList.
    ///     - Space: O(n), n is the count of LinkedList.
    let list: [ListNode]
    /** @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node. */
    init(_ head: ListNode?) {
        var nodeList = [ListNode]()
        var node = head
        while let cnode = node {
            nodeList.append(cnode)
            node = cnode.next
        }
        self.list = nodeList
    }
    
    /** Returns a random node's value. */
    /// - Complexity:
    ///     - Time: O(1)
    func getRandom() -> Int {
        let index = Int.random(in: 0 ..< self.list.count)
        return self.list[index].val
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */