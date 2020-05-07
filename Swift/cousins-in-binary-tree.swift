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
/**
 * https://leetcode.com/problems/cousins-in-binary-tree/
 * 
 * 
 */ 
// Date: Thu May  7 09:35:27 PDT 2020
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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var queue: [TreeNode?] = [root, nil]
        var set: Set<Int> = []
        
        while queue.isEmpty == false {
            var n = queue.count
            
            while n > 0 {
                let exisiting = set.count
                
                let node1 = queue.removeFirst()
                let node2 = queue.removeFirst()
                n -= 2
                if node1 != nil, (node1!.val == x || node1!.val == y) {
                    set.insert(node1!.val)
                }
                if node2 != nil, (node2!.val == x || node2!.val == y) {
                    set.insert(node2!.val)
                }
                
                if exisiting == 0, set.count == 2 { return false }
                if node1 != nil {
                    queue.append(node1?.left)
                    queue.append(node1?.right)
                }
                if node2 != nil {
                    queue.append(node2?.left)
                    queue.append(node2?.right)
                }
            }
            if set.count == 2 { return true }
            if set.count == 1 { return false }
        }
        return false
    }
}
