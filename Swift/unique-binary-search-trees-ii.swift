/**
 * https://leetcode.com/problems/unique-binary-search-trees-ii/
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 { return [] }
        let nums = Array(1...n)
        return generate(pool: nums)
    }
    
    func generate(pool: [Int]) -> [TreeNode?] {
        if pool.count == 0 { return [nil] }
        
        var list = [TreeNode]()
        for index in 0..<pool.count {
            var cPool = pool
            cPool.remove(at: index)
            for lnode in generate(pool: Array(pool[0..<index])) {
                for rnode in generate(pool: Array(pool[index+1..<pool.count])) {
                    let root = TreeNode(pool[index])
                    root.left = lnode
                    root.right = rnode
                    list.append(root)
                }
            }
        }
        return list
    }
}
