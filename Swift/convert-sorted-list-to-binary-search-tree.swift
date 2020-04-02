/**
 * https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
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
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the number of element in the linkedlist
    ///     - Space: O(logn), logn is the height of BST.
    ///
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var list = [Int]()
        var node = head
        // O(n)
        while node != nil {
            list.append(node!.val)
            node = node?.next
        }
        // T(n) = 2T(n/2) + O(1)
        // T(n) = O(n)
        func constructBST(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            let mid = left + (right - left) / 2
            let root = TreeNode(list[mid])
            root.left = constructBST(left, mid - 1)
            root.right = constructBST(mid + 1, right)
            return root
        }
        
        return constructBST(0, list.count - 1)
    }
    
}
