/**
 * https://leetcode.com/problems/jump-game-iii/
 * 
 * 
 */ 
// Date: Sun Nov 29 10:34:46 PST 2020
class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var queue = [start]
        var visited: Set<Int> = [start]
        while queue.isEmpty == false {
            let index = queue.removeFirst()
            if arr[index] == 0 { return true }
            let left = index - arr[index]
            let right = index + arr[index]
            if left >= 0, visited.contains(left) == false {
                visited.insert(left)
                queue.append(left)
            }
            if right < arr.count, visited.contains(right) == false {
                visited.insert(right)
                queue.append(right)
            }
        }
        return false
    }
}