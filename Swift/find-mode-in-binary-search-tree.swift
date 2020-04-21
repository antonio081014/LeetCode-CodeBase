/**
 * https://leetcode.com/problems/find-mode-in-binary-search-tree/
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
    /// - Complexity:
    ///     - Time: O(n): n is the number of nodes in the tree
    ///     - Space: O(n): n is the number of nodes in the tree
    ///
    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var count: [Int : Int] = [:]
        var queue = [root]
        var maxC = 0
        var result: [Int] = []
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            let cost = count[node.val, default: 0] + 1
            count[node.val] = cost
            
            if cost > maxC {
                result = [node.val]
                maxC = cost
            } else if cost == maxC {
                result.append(node.val)
            }
            
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return result
    }
}

class Solution {
    /// - Complexity:
    ///     - Time: O(n), number of nodes in the tree.
    ///     - Space: O(1), Assume that the implicit stack space incurred due to recursion does not count.
    ///
    func findMode(_ root: TreeNode?) -> [Int] {
        var last = -1
        var count = 0
        var result: [Int] = []
        var mCount = 0
        func inorder(_ root: TreeNode?) {
            guard let root = root else { return }
            
            inorder(root.left)
            
            if root.val == last {
                count += 1
            } else {
                count = 1
                last = root.val
            }
            if count > mCount {
                mCount = count
                result = [last]
            } else if count == mCount {
                result.append(last)
            }
            
            inorder(root.right)
        }
        
        inorder(root)
        
        return result
    }
}
