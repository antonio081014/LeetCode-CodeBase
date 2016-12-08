/**
 * Problem Link: https://leetcode.com/problems/binary-tree-postorder-traversal/
 *
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

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
        if let root = root {
            var ret = [Int]()
            ret += postorderTraversal(root.left)
            ret += postorderTraversal(root.right)
            ret.append(root.val)
            return ret
        }
        return [Int]()
    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var ret = [Int]()
        var queue = [TreeNode]()
        if let root = root {
            queue.append(root)
            while !queue.isEmpty {
                let node = queue.popLast()!
                ret.insert(node.val, at: 0)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            return ret
        }
        return [Int]()
    }
}


// MARK: - Case Test.
let root = TreeNode(1)
root.right = TreeNode(2)
root.right!.left = TreeNode(3)
let solution = Solution()
print("\(solution.postorderTraversal(root))")
