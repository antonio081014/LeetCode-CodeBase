/**
 * https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
 * 
 * 
 */ 
// Date: Tue May 26 10:52:19 PDT 2020
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
    /// Recursive solution.
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree.
    ///     - Space: O(height of tree), could be logn to n.
    ///
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val == p?.val || root.val == q?.val { return root }
        
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        
        if left != nil, right != nil { return root }
        if left != nil { return left}
        if right != nil { return right }
        return nil
    }
}
/**
 * https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
 * 
 * 
 */ 
// Date: Tue May 26 11:30:46 PDT 2020
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

/// Extension to make TreeNode hashable, so it could be used as a key in dictionary.
extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
    }
}

class Solution {
    /// Let var parent: [TreeNode : TreeNode?] keep all the parent nodes of each node in the tree.
    /// Then, add all the nodes from p to root to the Set
    /// Then, traverse from q to root, to find the first common ancester along the path.
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree.
    ///     - Space: O(n), n is the number of nodes in the tree. queue uses O(height of tree), dictionary uses O(n). list uses O(height of tree)
    ///
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        var parent: [TreeNode : TreeNode?] = [root : nil]
        var queue = [root]
        
        while parent[p] == nil || parent[q] == nil {
            let node = queue.removeLast()
            if let left = node.left {
                parent[left] = node
                queue.append(left)
            }
            if let right = node.right {
                parent[right] = node
                queue.append(right)
            }
        }
        
        var list: Set<TreeNode> = []
        var node: TreeNode? = p
        while node != nil {
            list.insert(node!)
            node = parent[node!]!
        }
        
        node = q
        while list.contains(node!) == false {
            node = parent[node!]!
        }
        return node
    }
}
/**
 * https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
 * 
 * 
 */ 
// Date: Tue May 26 11:50:35 PDT 2020
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
    ///     - Time: O(n), visiting all possible nodes using DFS to get the path from root to specified target node.
    ///     - Space: O(height of tree), each path stores the path from root to target node, which could be the height of tree or shorter. Also, recursive functions call will be less than the height of tree.
    ///
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var pathP = [TreeNode]()
        var pathQ = [TreeNode]()
        
        if findPath(root, &pathP, p), findPath(root, &pathQ, q) {
            // Find the first different node along the two paths starting from root.
            // Then the parent node of this node will be the lca.
            var index = 0
            while index < pathP.count, index < pathQ.count {
                if pathP[index].val != pathQ[index].val {
                    break
                }
                index += 1
            }
            return pathP[index - 1]
            
        }
        return nil
    }
    
    /// Find the path from root to specified target node.
    private func findPath(_ root: TreeNode?, _ path: inout [TreeNode], _ target: TreeNode?) -> Bool {
        guard let root = root else { return false }
        path.append(root)
        if root.val == target?.val { return true }
        if findPath(root.left, &path, target) || findPath(root.right, &path, target) {
            return true
        }
        path.removeLast()
        return false
    }
}
