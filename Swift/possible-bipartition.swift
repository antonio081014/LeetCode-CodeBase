/**
 * https://leetcode.com/problems/possible-bipartition/
 * 
 * 
 */ 
// Date: Wed May 27 16:53:54 PDT 2020
class Solution {
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        var graph = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
        for item in dislikes {
            graph[item[0]][item[1]] = true
            graph[item[1]][item[0]] = true
        }
        var palette = Array(repeating: 0, count: N + 1)
        
        func paint(_ spot: Int, _ color: Int) -> Bool {
            if palette[spot] != 0 { return palette[spot] == color }
            palette[spot] = color
            for x in 1 ... N {
                if graph[spot][x] {
                    if palette[x] == color { return false }
                    if paint(x, -color) == false { return false }
                }
            }
            return true
        }
        
        for x in 1 ... N {
            if palette[x] == 0, paint(x, 1) == false {
                return false
            }
        }
        return true
    }
}

class Solution {
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        var graph: [[Int]] = Array(repeating: [Int](), count: N + 1)
        for item in dislikes {
            graph[item[0]].append(item[1])
            graph[item[1]].append(item[0])
        }
        var palette = Array(repeating: 0, count: N + 1)
        
        func paint(_ spot: Int, _ color: Int) -> Bool {
            palette[spot] = color
            for x in graph[spot] {
                if palette[x] == color { return false }
                if palette[x] == 0, paint(x, -color) == false { return false }
            }
            return true
        }
        
        for x in 1 ... N {
            if palette[x] == 0, paint(x, 1) == false {
                return false
            }
        }
        return true
    }
}


