/**
 * https://leetcode.com/problems/serialize-and-deserialize-bst/
 * 
 * 
 */ 
// Date: Sun Jun 28 11:39:57 PDT 2020
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

/// Same as https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var ret: [String] = []
        var queue = [root]
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            if let node = node {
                ret.append("\(node.val)")
                queue.insert(node.right, at: 0)
                queue.insert(node.left, at: 0)
            } else {
                ret.append("null")
            }
        }
        print("\(ret)")
        return ret.joined(separator: ",")
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        func build(_ data: [String], at index: inout Int) -> TreeNode? {
            let content = data[index]
            index += 1
            if content == "null" { return nil }
            let node = TreeNode(Int(content)!)
            node.left = build(data, at: &index)
            node.right = build(data, at: &index)
            return node
        }
        
        let data = data.split(separator: ",").map { String($0) }
        var index = 0
        let node = build(data, at: &index)
        return node
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.serialize(root)
 * let ans = obj.serialize(s)
 */
