class Solution {
    func swimInWater(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var right = grid.flatMap { $0 }.max()!
        var left = grid[0][0]
        while left < right {
            let mid = left + (right - left) / 2
            if isPossible(grid, mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    private func isPossible(_ grid: [[Int]], _ threshold: Int) -> Bool {
        guard grid[0][0] <= threshold else { return false }
        let n = grid.count
        var visited: Set<[Int]> = [[0, 0]]
        var queue = [[0, 0]]
        let dt = [1, 0, -1, 0, 1]
        while queue.isEmpty == false {
            let cur = queue.removeFirst()
            if cur == [n - 1, n - 1] { return true }
            for index in 0 ..< 4 {
                let xx = cur[0] + dt[index]
                let yy = cur[1] + dt[index + 1]
                if xx >= 0, xx < n, yy >= 0, yy < n , visited.contains([xx, yy]) == false, grid[xx][yy] <= threshold {
                    visited.insert([xx, yy])
                    queue.append([xx, yy])
                }
            }
        }
        return false
    }
}
