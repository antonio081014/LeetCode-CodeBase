class Solution {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    // Give each property a default value if there is no initliazer for this class.
    var n: Int = 0
    var m: Int = 0
    var mark = [[Bool]]()
    
    func solve(inout board: [[Character]]) {
        n = board.count
        if n == 0 {
            return
        }
        m = board[0].count
        mark = [[Bool]](count: n, repeatedValue: [Bool](count: m, repeatedValue: false))
        
        for i in 0..<n {
            if board[i][0] == "O" {
                bfs(i, 0, board)
            }
            if board[i][m-1] == "O" {
                bfs(i, m-1, board)
            }
        }
        
        for i in 0..<m {
            if board[0][i] == "O" {
                bfs(0, i, board)
            }
            if board[n-1][i] == "O" {
                bfs(n-1, i, board)
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == "O" && !mark[i][j] {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    // Trying to mark each disclosing grid with "O" as true.
    private func bfs(_ a: Int, _ b: Int, _ board: [[Character]]) {
        var queue = [(Int, Int)]()
        queue.append((a, b))
        mark[a][b] = true
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            for i in 0..<4 {
                let xx = x + dx[i]
                let yy = y + dy[i]
                if (xx >= 0 && xx < n && yy >= 0 && yy < m && board[xx][yy] == "O" && !mark[xx][yy]) {
                    // Mark the status on each grid, to avoid duplicate appending to the queue.
                    // This is critically important for Breadth-First-Search
                    mark[xx][yy] = true
                    queue.append((xx, yy))
                }
            }
        }
    }
}
/**
 * https://leetcode.com/problems/surrounded-regions/
 * 
 * 
 */ 
// Date: Wed Jun 17 10:56:04 PDT 2020
class Solution {
    func solve(_ board: inout [[Character]]) {
        let n = board.count
        guard let m = board.first?.count else { return }
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
        
        let dx = [1, 0, -1, 0]
        let dy = [0, 1, 0, -1]
        
        func visit(_ x: Int, _ y: Int) {
            for index in 0 ..< dx.count {
                let xx = x + dx[index]
                let yy = y + dy[index]
                if xx >= 0, xx < n, yy >= 0, yy < m, visited[xx][yy] == false, board[xx][yy] == "O" {
                    visited[xx][yy] = true
                    visit(xx, yy)
                }
            }
        }
        
        for y in 0 ..< m {
            if board[0][y] == "O", visited[0][y] == false {
                visited[0][y] = true
                visit(0, y)
            }
            
            if board[n - 1][y] == "O", visited[n - 1][y] == false {
                visited[n - 1][y] = true
                visit(n - 1, y)
            }
        }
        
        for x in 0 ..< n {
            if board[x][0] == "O", visited[x][0] == false {
                visited[x][0] = true
                visit(x, 0)
            }
            
            if board[x][m - 1] == "O", visited[x][m - 1] == false {
                visited[x][m - 1] = true
                visit(x, m - 1)
            }
        }
        
        for x in 0 ..< n {
            for y in 0 ..< m {
                if board[x][y] == "O", !visited[x][y] {
                    board[x][y] = "X"
                }
            }
        }
    }
}
