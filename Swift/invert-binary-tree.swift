/**
 * https://leetcode.com/problems/invert-binary-tree/
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
    func invertTree(_ r: TreeNode?) -> TreeNode? {
        guard let root = r else {
            return r
        }
        var head = root
        let left = invertTree(head.right)
        let right = invertTree(head.left)
        head.left = left
        head.right = right
        return head
    }
    
    // Non-recursive Solution.
    func invertTree(_ r: TreeNode?) -> TreeNode? {
        guard let root = r else {
            return r
        }
        
        var head = root
        var stack = [TreeNode]()
        stack += [root]
        
        while !stack.isEmpty {
            var node = stack.popLast()!
            let left = node.left
            node.left = node.right
            node.right = left
            
            if let left = node.left {
                stack += [left]
            }
            if let right = node.right {
                stack += [right]
            }
        }
        return head
    }
}
/**
 * https://leetcode.com/problems/invert-binary-tree/
 * 
 * 
 */ 
// Date: Mon Jun  1 10:27:28 PDT 2020
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if let left = root?.left {
            self.invertTree(left)
        }
        if let right = root?.right {
            self.invertTree(right)
        }
        let left = root?.right
        root?.right = root?.left
        root?.left = left
        return root
    }
}
/**
 * https://leetcode.com/problems/invert-binary-tree/
 * 
 * 
 */ 
// Date: Mon Jun  1 10:30:27 PDT 2020
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            let tmpNode = node.left
            node.left = node.right
            node.right = tmpNode
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return root
    }
}
