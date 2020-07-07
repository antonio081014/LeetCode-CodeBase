/**
 * https://leetcode.com/problems/binary-tree-right-side-view/
 * 
 * 
 */ 
// Date: Tue Jul  7 12:00:29 PDT 2020
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    /// Tree Level Traverse
    /// Before hanld each level, append the last node's value to the result.
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree.
    ///     - Space: O(n), n is then number of nodes in the tree.
    ///
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue = [root]
        var result: [Int] = []
        while queue.isEmpty == false {
            var size = queue.count
            result.append(queue.last!.val)
            while size > 0 {
                let node = queue.removeFirst()
                size -= 1
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return result
    }
}
