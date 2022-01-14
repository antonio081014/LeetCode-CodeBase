/**
 * https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
 * 
 * 
 */ 
// Date: Tue Sep  8 09:26:36 PDT 2020
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

/// Use BFS to traverse through all the nodes in the tree.
/// - Complexity:
///     - Time: O(n), n is the number of nodes in the tree.
///     - Space: O(n), n is the number of nodes in the tree.
class Solution {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var sum = 0
        guard let root = root else { return sum }
        var queue: [(TreeNode, Int)] = [(root, 0)]
        while queue.isEmpty == false {
            let (node, prevSum) = queue.removeFirst()
            let cSum = (prevSum << 1) + node.val
            if node.left == nil, node.right == nil {
                sum += cSum
            } else {
                if let left = node.left {
                    queue.append((left, cSum))
                }
                if let right = node.right {
                    queue.append((right, cSum))
                }
            }
        }
        return sum
    }
}/**
 * https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
 * 
 * 
 */ 
// Date: Thu Jan 13 21:15:41 PST 2022
/// Recursive solution.

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
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var result = 0
        func getSum(_ root: TreeNode, _ sum: Int) {
            if root.left == nil, root.right == nil { 
                result += sum
                return
            }
            if let left = root.left {
                getSum(left, (sum << 1) + left.val)
            }
            
            if let right = root.right {
                getSum(right, (sum << 1) + right.val)
            }
        }

        guard let root = root else { return result }
        getSum(root, root.val)
        return result
    }
}