/// Date: Wed Mar  9 16:41:39 PST 2022
class Solution {
    /// - Complexity:
    ///     - Time: O(n * m * m), n = matrix.count, m = matrix.first?.count
    ///     - Space: O(n * m), n = matrix.count, m = matrix.first?.count
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        let n = matrix.count
        guard let m = matrix.first?.count else { return 0 }
        var sum = matrix
        // O(n * m)
        for x in 0 ..< n {
            for y in stride(from: 1, to: m, by: 1) {
                sum[x][y] += sum[x][y - 1]
            }
        }
        
        var result = 0
        // O(n * m * m)
        for leftCol in stride(from: 0, to: m, by: 1) {
            for rightCol in stride(from: leftCol, to: m, by: 1) {
                var colSumCounter: [Int : Int] = [0 : 1]
                var currentSum = 0
                for row in 0 ..< n {
                    currentSum += sum[row][rightCol] - (leftCol > 0 ? sum[row][leftCol - 1] : 0)
                    result += colSumCounter[currentSum - target, default: 0]
                    colSumCounter[currentSum, default: 0] += 1
                }
            }
        }
        return result
    }
}
