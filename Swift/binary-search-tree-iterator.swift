/**
 * https://leetcode.com/problems/binary-search-tree-iterator/
 * 
 * 
 */ 
// Date: Mon Aug 24 14:15:09 PDT 2020
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

class BSTIterator {

    var candidate: [Int]
    var index: Int
    init(_ root: TreeNode?) {
        self.candidate = BSTIterator.inorderTraversal(root)
        self.index = 0
    }

    /// Iterative solution.
    private static func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int]()
        var stack: [TreeNode] = []
        self.pushAllLeftChildren(root, into: &stack)
        while stack.isEmpty == false {
            let node = stack.removeLast()
            result.append(node.val)
            self.pushAllLeftChildren(node.right, into: &stack)
        }
        return result
    }
    
    private static func pushAllLeftChildren(_ root: TreeNode?, into stack: inout [TreeNode]) {
        var node = root
        while let cNode = node {
            stack.append(cNode)
            node = cNode.left
        }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        let val = self.candidate[index]
        index += 1
        return val
        
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return index < self.candidate.count
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */