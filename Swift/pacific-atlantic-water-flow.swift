/**
 * https://leetcode.com/problems/pacific-atlantic-water-flow/
 * 
 * 
 */ 
// Date: Thu Mar 25 14:21:32 PDT 2021
class Solution {
    struct FlowReachableSource: OptionSet {
        let rawValue: Int

        static let pacific    = FlowReachableSource(rawValue: 1 << 0)
        static let atlantic  = FlowReachableSource(rawValue: 1 << 1)
        static let all: FlowReachableSource = [.pacific, .atlantic]
        var description: String {
            return "\(self.rawValue)"
        }
    }

    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        var result: Set<[Int]> = []
        let n = matrix.count
        guard let m = matrix.first?.count else { return [] }

        var mark: [[FlowReachableSource]] = Array(repeating: Array(repeating: [], count: m), count: n)

        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]

        func dfs(_ x: Int, _ y: Int, from source: FlowReachableSource) {
            mark[x][y].formUnion(source)
            for index in 0 ..< dx.count {
                let xx = x + dx[index]
                let yy = y + dy[index]

                if xx >= 0, xx < n, yy >= 0, yy < m, mark[xx][yy].contains(source) == false, matrix[xx][yy] >= matrix[x][y] {
                    dfs(xx, yy, from: source)
                }
            }
        }

        for x in 0 ..< n {
            dfs(x, 0, from: .pacific)
            dfs(x, m - 1, from: .atlantic)
        }

        for y in 0 ..< m {
            dfs(0, y, from: .pacific)
            dfs(n - 1, y, from: .atlantic)
        }

        for x in 0 ..< n {
            for y in 0 ..< m {
                // print("\(x) - \(y) : \(mark[x][y])")
                if mark[x][y].contains(.all) {
                    result.insert([x, y])
                }
            }
        }
        

        return Array(result)
    }
}
