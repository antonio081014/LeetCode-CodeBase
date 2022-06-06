class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let n = matrix.count
        guard let m = matrix.first?.count else { return [] }
        var result = Array(repeating: Array(repeating: -1, count: n), count: m)
        for x in 0 ..< n {
            for y in 0 ..< m {
                result[y][x] = matrix[x][y]
            }
        }
        return result
    }
}
