class Solution {
    
    private let dirs = [1, 0, -1, 0, 1]
    
    private func paint(_ x: Int, _ y: Int, _ grid: inout [[Int]], _ queue: inout [(x: Int, y: Int)]) {
        let n = grid.count
        if x >= 0, x < n, y >= 0 , y < n, grid[x][y] == 1 {
            grid[x][y] = 2
            queue.append((x, y))
            for index in 0 ..< 4 {
                paint(x + dirs[index], y + dirs[index + 1], &grid, &queue)
            }
        }
    }
    
    func shortestBridge(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var grid = grid
        var queue = [(x: Int, y: Int)]()
        for x in 0 ..< n {
            for y in 0 ..< n {
                if queue.isEmpty == false { break }
                paint(x, y, &grid, &queue)
            }
        }
        // print(grid)
        while queue.isEmpty == false {
            var sz = queue.count
            while sz > 0 {
                let (x, y) = queue.removeFirst()
                sz -= 1
                for index in 0 ..< 4 {
                    let xx = x + dirs[index]
                    let yy = y + dirs[index + 1]
                    if xx >= 0, xx < n, yy >= 0, yy < n {
                        if grid[xx][yy] == 1 {
                            return grid[x][y] - 2
                        } else if grid[xx][yy] == 0 {
                            grid[xx][yy] = 1 + grid[x][y]
                            queue.append((xx, yy))
                        }
                    }
                }
            }
        }
        return -1
    }
}
