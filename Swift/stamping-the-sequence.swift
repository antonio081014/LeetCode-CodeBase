/**
 * https://leetcode.com/problems/stamping-the-sequence/
 * 
 * 
 */ 
// Date: Wed Mar 31 11:25:43 PDT 2021
class Solution {
    func movesToStamp(_ stamp: String, _ target: String) -> [Int] {
        let m = stamp.count
        let n = target.count
        let stamp = Array(stamp)
        let target = Array(target)
        var queue: [Int] = []
        var result: [Int] = []
        var done = Array(repeating: false, count: n)
        var state: [[Set<Int>]] = []
        
        for index in stride(from: 0, through: n - m, by: 1) {
            var match: Set<Int> = []
            var todo: Set<Int> = []
            
            for j in 0 ..< m {
                if stamp[j] == target[index + j] {
                    match.insert(index + j)
                } else {
                    todo.insert(index + j)
                }
            }
            state.append([match, todo])
            // print("\(match) - \(todo)")
            
            if todo.isEmpty {
                result.append(index)
                for j in 0 ..< m {
                    if done[index + j] == false {
                        queue.append(index + j)
                        done[index + j] = true
                    }
                }
            }
        }
        // print(result)
        while queue.isEmpty == false {
            let index = queue.removeFirst()
            for start in stride(from: max(0, index - m + 1), through: min(n - m, index), by: 1) {
                if state[start][1].contains(index) {
                    state[start][1].remove(index)
                    if state[start][1].isEmpty {
                        result.append(start)
                        for j in state[start][0] {
                            if done[j] == false {
                                done[j] = true
                                queue.append(j)
                            }
                        }
                    }
                }
            }
        }
        if done.filter { $0 == false }.count > 0 { return [] }
        // print(result)
        return result.reversed()
    }
}