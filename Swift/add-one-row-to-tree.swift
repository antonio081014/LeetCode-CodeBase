/**
 * https://leetcode.com/problems/add-one-row-to-tree/
 * 
 * 
 */ 
// Date: Tue Mar  9 13:36:32 PST 2021
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
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        if d == 1 {
            return TreeNode(v, root, nil)
        } else if d == 2 {
            let left = root?.left
            let right = root?.right
            root?.left = TreeNode(v, left, nil)
            root?.right = TreeNode(v, nil, right)
            return root
        }
        root?.left = addOneRow(root?.left, v, d - 1)
        root?.right = addOneRow(root?.right, v, d - 1)
        return root
    }
}/**
 * https://leetcode.com/problems/add-one-row-to-tree/
 * 
 * 
 */ 
// Date: Tue Mar  9 13:55:29 PST 2021
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
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        if d == 1 {
            return TreeNode(v, root, nil)
        }
        guard let root = root else { return nil }
        var queue = [root]
        var level = 0
        while queue.isEmpty == false {
            level += 1
            var size = queue.count
            while size > 0 {
                size -= 1
                let node = queue.removeFirst()
                if level + 1 == d {
                    node.left = TreeNode(v, node.left, nil)
                    node.right = TreeNode(v, nil, node.right)
                } else {
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }
                }
            }
            if level + 1 == d { queue = [] }
        }
        return root
    }
}

class Solution {
    func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
        if d == 1 {
            return TreeNode(v, root, nil)
        }
        guard let root = root else { return nil }
        var queue = [root]
        var toUpdateList: [TreeNode] = []
        var level = 0
        while queue.isEmpty == false {
            level += 1
            var size = queue.count
            while size > 0 {
                size -= 1
                let node = queue.removeFirst()
                if level + 1 < d {
                    if let left = node.left { queue.append(left) }
                    if let right = node.right { queue.append(right) }
                } else {
                    toUpdateList.append(node)
                }
            }
        }
        for node in toUpdateList {
            node.left = TreeNode(v, node.left, nil)
            node.right = TreeNode(v, nil, node.right)
        }
        return root
    }
}