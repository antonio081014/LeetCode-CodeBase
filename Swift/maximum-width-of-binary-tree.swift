/**
 * https://leetcode.com/problems/maximum-width-of-binary-tree/
 * 
 * 
 */ 
// Date: Fri Jul 10 22:56:25 PDT 2020
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
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [(root, 0)]
        var maxL: Int = 1
        
        while queue.isEmpty == false {
            var size = queue.count
            while size > 0 {
                let (node, position) = queue.removeFirst()
                size -= 1
                if let left = node.left {
                    queue.append((left, position &* 2))
                }
                if let right = node.right {
                    queue.append((right, position &* 2 + 1))
                }
            }
            if let first = queue.first, let last = queue.last {
                maxL = max(maxL, last.1 - first.1 + 1)
            }
        }
        
        return maxL
    }
}
/**
 * https://leetcode.com/problems/maximum-width-of-binary-tree/
 * 
 * 
 */ 
// Date: Fri Jul 10 23:20:20 PDT 2020
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
    // Introduce the offset.
    // This solution shift all the position to left by offset.
    // Reference: https://www.youtube.com/watch?v=7LBdfdC8vhs
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [(root, 0)]
        var maxL: Int = 1
        
        while queue.isEmpty == false {
            var size = queue.count
            let offset = queue.first?.1 ?? 0
            while size > 0 {
                let (node, position) = queue.removeFirst()
                size -= 1
                if let left = node.left {
                    queue.append((left, position * 2 - offset))
                }
                if let right = node.right {
                    queue.append((right, position * 2 - offset + 1))
                }
            }
            if let first = queue.first, let last = queue.last {
                maxL = max(maxL, last.1 - first.1 + 1)
            }
        }
        
        return maxL
    }
}
