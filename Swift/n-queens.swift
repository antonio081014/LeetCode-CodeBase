/**
 * Problem Link: https://leetcode.com/problems/n-queens/
 *
 */

class Solution {
    /// Solution container.
    var all_solutions: [[Int]]!
    
    func solveNQueens(_ n: Int) -> [[String]] {
        all_solutions = [[Int]]()
        self.solve([Int](), for: 0, with: n)
        var ret = [[String]]()
        for solution in all_solutions {
            ret.append(print(solution))
        }
        return ret
    }
    
    /// Solve.
    private func solve(_ solution: [Int], for ithRow: Int, with nRows: Int) {
        if isSolution(ithRow: ithRow, with: nRows) {
            all_solutions.append(solution)
            return
        }
        
        let candidate = self.construct(solution, for: nRows)
        for cand in candidate {
            solve(solution + [cand], for: ithRow + 1, with: nRows)
        }
    }
    
    /// Check if we have reached the final solution.
    private func isSolution(ithRow: Int, with nRows: Int) -> Bool {
        return ithRow == nRows
    }
    
    /// Construct candidate based on the selected columns for first x rows.
    /// 
    /// x = selected.count
    private func construct(_ selected: [Int], for nCols: Int) -> [Int] {
        var ret = [Int]()
        for col in 0..<nCols {
            if isLegal(selected, for: col) {
                ret.append(col)
            }
        }
        return ret
    }
    
    /// Check if x could be a legal selection based on current selected elements.
    private func isLegal(_ selected: [Int], for x: Int) -> Bool {
        for i in 0..<selected.count {
            if selected[i] == x {
                return false
            }
            if selected.count - i == x - selected[i] || selected.count - i == selected[i] - x {
                return false
            }
        }
        return true
    }
    
    /// Print out the solution in an Array of Strings.
    private func print(_ solution: [Int]) -> [String] {
        var ret = [String]()
        for x in solution {
            var s = ""
            for i in 0..<solution.count {
                if x == i {
                    s += "Q"
                } else {
                    s += "."
                }
            }
            ret.append(s)
        }
        return ret
    }
    
}

// Tue Mar 24 11:42:51 PDT 2020
class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result: [[String]] = []
        var solution: [Int] = []
        self.selectNthQueen(0, n, &solution, &result)
        return result
    }

    /// Try to select nth queen's column position at the nth row.
    /// - Parameters: 
    ///     - nth: nth row, the row will be assigned a queen at one of available column position.
    ///     - totalQueens: the total number of queens will be available on the board.
    ///     - solution: existing selected columns positions. solution[index] is the column position for index-th queen at row index.
    ///     - result: final visualized graph solution for this problem.
    ///
    fileprivate func selectNthQueen(_ nth: Int, _ totalQueens: Int, _ solution: inout [Int], _ result: inout [[String]]) {
        // Convert the valid solution to a visualized puzzle.
        // Then, add it to expected result array.
        func convert2Result() {
            var puzzle: [String] = []
            for x in solution {
                var row = ""
                for index in 0 ..< totalQueens {
                    row += index == x ? "Q" : "."
                }
                puzzle.append(row)
            }
            result.append(puzzle)
        }

        // Validate if it's a legal col, criteria
        // 1. Not the same col with any existing col in current solution, since no two queens could share the same column.
        // 2. Not able to attack diagonally.
        func validation(_ col: Int) -> Bool {
            for index in 0 ..< solution.count {
                if col == solution[index] { return false }
                if abs(solution.count - index) == abs(col - solution[index]) { return false }
            }
            return true
        }

        // Start with base case.
        if nth == totalQueens {
            convert2Result()
            return
        }

        // Go through every possible column.
        // Validate if it's a legal col.
        // If it is, then add it to solution temporarily.
        // Then DFS this solution.
        // When done, we should try next solution. 
        // But before we try the next one, remove current selection for nth row is necessery.
        for x in 0 ..< totalQueens {
            if validation(x) {
                solution.append(x)
                self.selectNthQueen(nth + 1, totalQueens, &solution, &result)
                solution.removeLast()
            }
        }
    }
}
