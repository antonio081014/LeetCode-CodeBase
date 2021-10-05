/**
 * https://leetcode.com/problems/split-linked-list-in-parts/
 * 
 * 
 */ 
// Date: Wed Sep 29 19:25:43 PDT 2021
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var count = 0
        var node = head
        while node != nil {
            count += 1
            node = node?.next
        }
        let size = count / k
        var pre = size == 0 ? 0 : count - k * size
        var result = [ListNode?]()
        node = head
        count = 0
        var fooNode: ListNode? = ListNode()
        var cNode: ListNode? = fooNode
        var flag = false
        while node != nil {
            count += 1
            cNode?.next = node
            if count < size {
                cNode = cNode?.next
                node = node?.next
            } else {
                if !flag, result.count < pre {
                    cNode = cNode?.next
                    node = node?.next
                    flag = true
                } else {
                    flag = false
                    count = 0
                    result.append(fooNode?.next)
                    fooNode = ListNode()
                    cNode = fooNode

                    let next = node?.next
                    node?.next = nil
                    node = next
                }
            }
        }
        if count > 0 {
            result.append(fooNode?.next)
        }
        if result.count < k {
            for _ in result.count ..< k {
                result.append(nil)
            }
        }
        return result
    }
}/**
 * https://leetcode.com/problems/split-linked-list-in-parts/
 * 
 * 
 */ 
// Date: Mon Oct  4 19:13:19 PDT 2021
class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0) { $0 + $1 }
        guard sum % k == 0 else { return false }
        let target = sum / k
        func dfs(_ candidates: inout [Bool], _ start: Int, _ cSum: Int, _ group: Int) -> Bool {
            if group == 1 { return true }
            if cSum == target {
                return dfs(&candidates, 0, 0, group - 1)
            }
            for index in start ..< nums.count {
                if candidates[index] == true || cSum + nums[index] > target { continue }
                candidates[index] = true
                if dfs(&candidates, index + 1, cSum + nums[index], group) { return true }
                candidates[index] = false
            }
            return false
        }
        
        var cand = Array(repeating: false, count: nums.count)
        return dfs(&cand, 0, 0, k)
    }
    
}