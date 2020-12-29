/**
 * https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/
 * 
 * 
 */ 
// Date: Fri May 29 14:41:37 PDT 2020
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
    /// Traverse through every node in the tree.
    /// Collect val along the path, if val exists in the set, then remove it, otherwise, add it back.
    /// At the leaf nodes, if number of vals in collection is 0 or 1, then it's a possible Palindromic.
    /// - Complexity:
    ///     - Time: O(n), n is the number of nodes in the tree.
    ///     - Space: O(height of tree), since we only need to store the vals along the single path.
    ///
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        func traverse(_ root: TreeNode, _ collection: inout Set<Int>, _ result: inout Int) {
            if collection.contains(root.val) {
                collection.remove(root.val)
            } else {
                collection.insert(root.val)
            }
            
            if root.left == nil, root.right == nil {
                result += collection.count <= 1 ? 1 : 0
            }
            
            if let left = root.left {
                traverse(left, &collection, &result)
            }
            if let right = root.right {
                traverse(right, &collection, &result)
            }
            
            if collection.contains(root.val) {
                collection.remove(root.val)
            } else {
                collection.insert(root.val)
            }
        }
        
        var result = 0
        var collection: Set<Int> = []
        guard let root = root else { return result }
        traverse(root, &collection, &result)
        return result
    }
}
/**
 * https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/
 * 
 * 
 */ 
// Date: Tue Dec 29 10:00:28 PST 2020
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
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var result = 0
        func dfs(_ root: TreeNode, _ count: inout [Int]) {
            count[root.val] += 1
            if root.left == nil, root.right == nil {
                var odds = 0
                for x in count {
                    if x % 2 == 1 {
                        odds += 1
                    }
                }
                if odds <= 1 { result += 1 }
                count[root.val] -= 1
                return
            }
            if let left = root.left {
                dfs(left, &count)
            }
            if let right = root.right {
                dfs(right, &count)
            }
            count[root.val] -= 1
        }
        guard let root = root else { return result }
        var count = Array(repeating: 0, count: 10)
        dfs(root, &count)
        return result
    }
}