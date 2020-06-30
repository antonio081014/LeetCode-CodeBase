/**
 * https://leetcode.com/problems/word-search/
 * 
 * 
 */ 
class Solution {
    let dir:[(Int, Int)] = [(1,0), (0,1), (-1,0), (0,-1)]
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let n = board.count
        if n == 0 {
            return false
        }
        let m = board[0].count
        
        let wlist = word.characters.map({String($0)})
        for x in 0..<n {
            for y in 0..<m {
                if exist(x: x, y: y, Array(repeating: Array(repeating: false, count: m), count: n), board, wlist) {
                    return true
                }
            }
        }
        return false
    }
    
    private func exist(x: Int, y: Int, _ visited: [[Bool]], _ board:[[Character]], _ word: [String]) -> Bool {
        if String(board[x][y]) != word.first! {
            return false
        }
        
        let wList = Array(word.dropFirst(1))
        if wList.count == 0 {
            return true
        }
        
        var visitedDup = visited
        visitedDup[x][y] = true
        
        for (dx, dy) in dir {
            let xx = x + dx
            let yy = y + dy
            if xx>=0, xx<board.count, yy>=0, yy<board[0].count, !visited[xx][yy]{
                if exist(x: xx, y: yy, visitedDup, board, wList) {
                    return true
                }
            }
        }
        
        return false
    }
}
/**
 * https://leetcode.com/problems/word-search/
 * 
 * 
 */ 
// Date: Tue Jun 30 11:45:48 PDT 2020
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let n = board.count
        guard let m = board.first?.count else { return word.isEmpty }
        let word = Array(word)
        
        func verify(_ x: Int, _ y: Int, at index: Int, _ visited: inout [[Bool]]) -> Bool {
            if board[x][y] != word[index] { return false }
            if index == word.count - 1 {
                return true
            }
            
            visited[x][y] = true
            
            let dx = [1, 0, -1, 0]
            let dy = [0, 1, 0, -1]
            
            for offset in 0 ..< dx.count {
                let xx = x + dx[offset]
                let yy = y + dy[offset]
                if xx >= 0, xx < n, yy >= 0, yy < m, visited[xx][yy] == false {
                    if verify(xx, yy, at: index + 1, &visited) { return true }
                }
            }
            
            visited[x][y] = false
            return false
        }
        
        for x in 0 ..< n {
            for y in 0 ..< m {
                var visited = Array(repeating: Array(repeating: false, count: m), count: n)
                if verify(x, y, at: 0, &visited) { return true }
            }
        }
        return false
    }
}
