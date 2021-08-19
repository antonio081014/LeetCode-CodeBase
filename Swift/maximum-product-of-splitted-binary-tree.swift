/**
 * https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/
 * 
 * 
 */ 
// Date: Thu Aug 19 10:42:57 PDT 2021
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
    func maxProduct(_ root: TreeNode?) -> Int {
        var sumList = [UInt]()
        func getSum(_ root: TreeNode?) -> UInt {
            guard let root = root else { return 0 }
            var sum = UInt(root.val)
            sum += getSum(root.left)
            sum += getSum(root.right)
            sumList.append(sum)
            return sum
        }
        let sum = getSum(root)
        sumList = sumList.sorted()
        var result: UInt = 0
        for index in 0 ..< sumList.count - 1 {
            result = max(result, (sumList[index] * (sum - sumList[index])))
        }
        return Int(result % 1000000007)
    }
}