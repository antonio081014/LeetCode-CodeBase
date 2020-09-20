/**
 * https://leetcode.com/problems/unique-paths-iii/
 * 
 * 
 */ 
// Date: Sun Sep 20 11:16:22 PDT 2020
class Solution {
    /// - Complexity: 
    ///     - Time: O(4 * 3^(n*m - 1)) => O(3^(n*m)), n and m are the length and width.
    ///     - Space: O(valids), it's total number of valids.

    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var parentPath: [[Set<String>]] = Array(repeating:Array(repeating:[], count: m), count: n)
        var valids = 0
        var start = (0, 0)
        var end = (0, 0)
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] == 0 {
                    valids += 1
                } else if grid[x][y] == 1 {
                    start = (x, y)
                } else if grid[x][y] == 2 {
                    end = (x, y)
                }
            }
        }
                
        func dfs(_ current: (Int, Int), _ path: inout [String], _ visited: inout Set<String>) {
            let convPath = path.joined()
            if parentPath[current.0][current.1].contains(convPath) { return }
            parentPath[current.0][current.1].insert(convPath)
            // print("\(convPath) - \(current) - \(visited)")
            if current == end { return }
            let dx = [1, 0, -1, 0]
            let dy = [0, 1, 0, -1]
            path.append(String(format: "%02d%02d", current.0, current.1))
            for index in 0 ..< 4 {
                let xx = current.0 + dx[index]
                let yy = current.1 + dy[index]
                let shortPath = String(format: "%02d%02d", xx, yy)
                if xx >= 0, xx < n, yy >= 0, yy < m, visited.contains(shortPath) == false, grid[xx][yy] != -1 {
                    visited.insert(shortPath)
                    dfs((xx, yy), &path, &visited)
                    visited.remove(shortPath)
                }
            }
            path.removeLast()
        }
        var path = [String]()
        var visited: Set<String> = [String(format: "%02d%02d", start.0, start.1)]
        dfs(start, &path, &visited)
        valids += 1
        return parentPath[end.0][end.1].filter { $0.count == valids * 4 }.count
    }
}