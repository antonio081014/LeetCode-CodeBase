class Solution {
    /// - Complexity:
    ///     - Time: O(n*n*m*m)
    ///     - Space: O(1)
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        var res = Int.min
        let m = matrix.count
        let n = matrix[0].count
        
        for left in 0 ..< n {
            var rowsSum = Array(repeating: 0, count: m)
            for right in left ..< n {
                for row in 0 ..< m {
                    rowsSum[row] += matrix[row][right]
                }
                
                res = max(res, maxSumOfSubArray(rowsSum, lessThan: k))
            }
        }
        return res
    }
    
    /// - Complexity:
    ///     - Time: O(m^2)
    ///     - Space: O(1)
    private func maxSumOfSubArray(_ arr: [Int], lessThan k: Int) -> Int {
        var res = Int.min
        
        for i in 0..<arr.count {
            var sum = 0
            for j in i..<arr.count {
                sum += arr[j]
                if sum > res && sum <= k {
                    res = sum
                }
            }
        }
        
        return res
    }
}
