/**
 * Problem Link: https://leetcode.com/problems/sum-of-left-leaves/
 *
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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        return sumOfLeftLeaves(root, false)
    }
    
    private func sumOfLeftLeaves(_ root: TreeNode?, _ isLeft: Bool) -> Int {
        if let root = root {
            var sum = 0
            if isLeft && root.left == nil && root.right == nil {
                sum += root.val
                return sum
            }
            sum += sumOfLeftLeaves(root.left, true)
            sum += sumOfLeftLeaves(root.right, false)
            return sum
        }
        return 0
    }
}
/**
 * https://leetcode.com/problems/sum-of-left-leaves/
 * 
 * 
 */ 
// Date: Mon Aug 24 10:06:36 PDT 2020
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
 /// Using queue to traverse all the nodes in the tree.
 /// PS: the root with no leaves is not a leaf.
class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var sum = 0
        guard let root = root else { return sum }
        var queue = [(root, false)]
        while queue.isEmpty == false {
            let (node, isLeft) = queue.removeFirst()
            if node.left == nil, node.right == nil {
                if isLeft {
                    sum += node.val
                }
                continue
            }
            if let left = node.left {
                queue.append((left, true))
            }
            if let right = node.right {
                queue.append((right, false))
            }
        }
        return sum
    }
}