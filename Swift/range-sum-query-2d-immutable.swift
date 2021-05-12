/**
 * https://leetcode.com/problems/range-sum-query-2d-immutable/
 * 
 * 
 */ 
// Date: Wed May 12 07:01:26 PDT 2021
class NumMatrix {

    private let rangeSum: [[Int]]
    init(_ matrix: [[Int]]) {
        let n = matrix.count
        let m = matrix.first?.count ?? 0
        var sum = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        // print("\(m) - \(n)")
        for x in 0 ..< n {
            for y in 0 ..< m {
                sum[x + 1][y + 1] = matrix[x][y] + sum[x + 1][y] + sum[x][y + 1] - sum[x][y]
            }
        }
        // print(sum)
        self.rangeSum = sum
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return self.rangeSum[row2 + 1][col2 + 1] + self.rangeSum[row1][col1] - self.rangeSum[row2 + 1][col1] - self.rangeSum[row1][col2 + 1]
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */