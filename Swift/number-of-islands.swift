/**
 * https://leetcode.com/problems/number-of-islands/
 * 
 * 
 */
/// DFS
/// - Complexity:
///     - Time: O(n), n is the number elements in grid. n = rows * cols
///     - Space: O(n), n is the number elements in grid. n = rows * cols
///
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        var count = 0
        var grid = grid
        for x in 0 ..< grid.count {
            for y in 0 ..< grid.first!.count {
                if grid[x][y] == Character("1") {
                    count += 1
                    dfs(&grid, (x, y))
                }
            }
        }
        return count
    }
    
    fileprivate func dfs(_ grid: inout [[Character]], _ current: (Int, Int)) {
        grid[current.0][current.1] = Character("0")
        let dx = [0, -1, 0, 1]
        let dy = [1, 0, -1, 0]
        for index in 0 ..< dx.count {
            let xx = current.0 + dx[index]
            let yy = current.1 + dy[index]
            if xx >= 0, xx < grid.count, yy >= 0, yy < grid.first?.count ?? 0, grid[xx][yy] == Character("1") {
                dfs(&grid, (xx, yy))
            }
        }
    }
}

/// BFS
/// - Complexity:
///     - Time: O(n), n is the number elements in grid. n = rows * cols
///     - Space: O(n), n is the number elements in grid. n = rows * cols
///
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }
        var grid = grid
        var count = 0
        for x in 0 ..< grid.count {
            for y in 0 ..< grid.first!.count {
                if grid[x][y] == Character("1") {
                    count += 1
                    grid[x][y] = Character("0")
                    
                    var queue = [(x, y)]
                    while queue.isEmpty == false {
                        let (xx, yy) = queue.removeFirst()
                        let dx = [0, 1, 0, -1]
                        let dy = [1, 0, -1, 0]
                        for index in 0 ..< dx.count {
                            let xxx = xx + dx[index]
                            let yyy = yy + dy[index]
                            if xxx >= 0, xxx < grid.count, yyy >= 0, yyy < grid.first!.count, grid[xxx][yyy] == Character("1") {
                                grid[xxx][yyy] = Character("0")
                                queue.append((xxx, yyy))
                            }
                        }
                    }
                    
                }
            }
        }
        return count
    }
}
/**
 * https://leetcode.com/problems/number-of-islands/
 * 
 * 
 */ 
// Date: Tue Jul  7 11:53:48 PDT 2020
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var count = 0
        for x in 0 ..< n {
            for y in 0 ..< m {
                if grid[x][y] == Character("1") {
                    count += 1
                    var queue = [(x, y)]
                    grid[x][y] = Character("0")
                    let dx = [1, 0, -1, 0]
                    let dy = [0, 1, 0, -1]
                    while queue.isEmpty == false {
                        let (xx, yy) = queue.removeFirst()
                        for index in 0 ..< dx.count {
                            let xxx = xx + dx[index]
                            let yyy = yy + dy[index]
                            if xxx >= 0, xxx < n, yyy >= 0, yyy < m, grid[xxx][yyy] == Character("1") {
                                grid[xxx][yyy] = Character("0")
                                queue.append((xxx, yyy))
                            }
                        }
                    }
                }
            }
        }
        return count
    }
}
