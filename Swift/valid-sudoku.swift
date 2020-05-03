/**
 * https://leetcode.com/problems/valid-sudoku/
 * 
 * 
 */ 
// Date: Sun May  3 10:23:33 PDT 2020
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for line in 0 ..< 9 {
            if checkRow(board, at: line) == false { return false }
            if checkColumn(board, at: line) == false { return false }
            if line % 3 == 0 {
                if checkBlock(board, at: line, at: 0) == false { return false }
                if checkBlock(board, at: line, at: 3) == false { return false }
                if checkBlock(board, at: line, at: 6) == false { return false }
            }
        }
        return true
    }
    private func checkBlock(_ board: [[Character]], at row: Int, at col: Int) -> Bool {
        var set: Set<Int> = []
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                let c = String(board[row + x][col + y])
                if let num = Int(c) {
                    if set.contains(num) { return false }
                    set.insert(num)
                }
            }
        }
        return true
    }
    
    private func checkRow(_ board: [[Character]], at row: Int) -> Bool {
        var set: Set<Int> = []
        for column in 0 ..< 9 {
            let c = String(board[row][column])
            if let num = Int(c) {
                if set.contains(num) { return false }
                set.insert(num)
            }
        }
        return true
    }
    
    private func checkColumn(_ board: [[Character]], at column: Int) -> Bool {
        var set: Set<Int> = []
        for row in 0 ..< 9 {
            let c = String(board[row][column])
            if let num = Int(c) {
                if set.contains(num) { return false }
                set.insert(num)
            }
        }
        return true
    }
}
