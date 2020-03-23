/**
 * https://leetcode.com/problems/cousins-in-binary-tree/
 * 
 * 
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
    ///
    /// Traverse tree in level order.
    ///
    /// - Complexity:
    ///     - Time: O(n), n is the number of elements in the tree.
    ///     - Space: O(n), n is the number of elements in the tree.
    ///
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root, x != root.val, y != root.val else { return false }
        
        var queue = [root]
        var next: [TreeNode] = []
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            let lval = node.left?.val ?? 0
            let rval = node.right?.val ?? 0
            // If two nodes share the same parent node.
            if (lval == x && rval == y) || (lval == y && rval == x) { return false }
            if let left = node.left {
                next.append(left)
            }
            if let right = node.right {
                next.append(right)
            }

            if queue.isEmpty {
                let elements = next.map { $0.val }
                
                let foundx = elements.contains(x)
                let foundy = elements.contains(y)
                // If both x and y are in the same level without sharing the same parent node.
                // else if only one of two has been found in this level. Early termination.
                if foundx, foundy { return true }
                else if foundx != foundy { return false }
                queue = next
                next = []
            }
        }
        return false
    }
}
