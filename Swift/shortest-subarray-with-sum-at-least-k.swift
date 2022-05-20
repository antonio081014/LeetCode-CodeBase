class Solution {
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        var sum: [Int] = [0]
        let len = nums.count
        for n in nums {
            sum.append(sum.last! + n)
        }
        var result = len + 1
        
        var queue = [Int]()
        for index in 0 ..< len + 1 {
            while let first = queue.first, sum[index] - sum[first] >= k {
                result = min(result, index - first)
                queue.removeFirst()
            }
            while let last = queue.last, sum[index] <= sum[last] {
                queue.removeLast()
            }
            queue.append(index)
        }
        
        return result > len ? -1 : result
    }
}
