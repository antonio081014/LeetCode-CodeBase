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
/**
 * https://leetcode.com/problems/binary-tree-postorder-traversal/
 * 
 * 
 */ 
// Date: Mon May 11 16:13:32 PDT 2020
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
    /// Iterative solution.
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int]()
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            result.insert(node.val, at: 0)
            if let left = node.left {
                queue.insert(left, at: 0)
            }
            if let right = node.right {
                queue.insert(right, at: 0)
            }
        }
        return result
    }
}


class Solution {
    /// Recursive solution
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        return postorderTraversal(root.left) + postorderTraversal(root.right) + [root.val]
    }
}
