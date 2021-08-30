/**
 * https://leetcode.com/problems/sudoku-solver/
 * 
 * 
 */ 
// Date: Mon Aug 30 09:48:46 PDT 2021
class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        var row = Array(repeating: Set(1...9), count: 9)
        var col = Array(repeating: Set(1...9), count: 9)
        var block = Array(repeating: Set(1...9), count: 9)

        func precompute() {
            for x in 0 ..< 9 {
                for y in 0 ..< 9 {
                    if let num = Int(String(board[x][y])) {
                        row[x].remove(num)
                        col[y].remove(num)
                        let blockIndex = (x / 3) * 3 + (y / 3)
                        block[blockIndex].remove(num)
                    }
                }
            }
        }

        @discardableResult func dfs(_ x: Int, _ y: Int) -> Bool {
            if x == 9 { return true }
            if y == 9 { return dfs(x + 1, 0) }
            if board[x][y] != Character(".") { return dfs(x, y + 1) }
            let candidates = row[x].intersection(col[y]).intersection(block[(x / 3) * 3 + (y / 3)])
            for candidate in candidates {
                row[x].remove(candidate)
                col[y].remove(candidate)
                block[(x / 3) * 3 + (y / 3)].remove(candidate)
                board[x][y] = Character(String(candidate))
                if dfs(x, y + 1) { return true }
                board[x][y] = Character(String("."))
                row[x].insert(candidate)
                col[y].insert(candidate)
                block[(x / 3) * 3 + (y / 3)].insert(candidate)
            }
            return false
        }

        precompute()
        dfs(0, 0)
    }
}