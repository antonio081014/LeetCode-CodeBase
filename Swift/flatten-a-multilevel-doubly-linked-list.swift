/**
 * https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/
 * 
 * 
 */ 
// Date: Fri Jul 10 16:57:53 PDT 2020
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the number of elements in the list.
    ///     - Space: O(1), only constant of elements used here.
    ///
    func flatten(_ head: Node?) -> Node? {
        var node = head
        /// Go through DoubleLInked List from head.
        while node != nil {
            // If we found a node has child.
            if let child = node!.child {
                // 1. Recursively flatten the child double linked list.
                let childHead = flatten(child)
                // 2. Keep the next node of current node. This will be appended to the new tail.
                let next = node!.next
                // 3. Update current node's next to the previous child.
                node!.next = childHead
                // 4. Update child's prev to current node.
                childHead?.prev = node
                // 5. Nil the child
                node!.child = nil
                // 6. Move the node to the newly added double linked list's tail.
                var nNode = childHead
                while nNode?.next != nil {
                    nNode = nNode?.next
                }
                // 7. Update new tail's next
                nNode?.next = next
                // 8. Update new tail's next's prev as the new tail
                next?.prev = nNode
                // 9. Move on current node to the next to be handled node.
                node = next
            } else {
                // 9. Move on current node to the next to be handled node.
                node = node!.next
            }
        }
        // printNode(head)
        return head
    }
    
    private func printNode(_ head: Node?) {
        var node = head
        while node != nil {
            print("\(node!.val)")
            node = node?.next
        }
    }
}
