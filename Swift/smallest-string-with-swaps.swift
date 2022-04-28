class Solution {
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        let n = s.count
        var graph = Array(repeating: Set<Int>(), count: n)
        for p in pairs {
            graph[p[0]].insert(p[1])
            graph[p[1]].insert(p[0])
        }
        
        var color = 1
        var colorRecord = Array(repeating: 0, count: n)
        let s = Array(s)
        var colorMap = [Int : [Character]]()
        
        func colorDFS(_ index: Int, _ currentColor: Int) {
            colorRecord[index] = currentColor
            colorMap[currentColor, default: []].append(s[index])
            for neighbor in graph[index] {
                if colorRecord[neighbor] == 0 {
                    colorDFS(neighbor, currentColor)
                }
            }
        }
        
        for index in 0 ..< n {
            if colorRecord[index] == 0 {
                colorDFS(index, color)
                color += 1
            }
        }
        
        // print(colorRecord)
        // print(colorMap)
        
        for (key, value) in colorMap {
            colorMap[key] = value.sorted()
        }
        
        var result = ""
        for index in 0 ..< n {
            let c = colorRecord[index]
            let cand = colorMap[c, default: []].removeFirst()
            result.append(cand)
        }
        
        return result
    }
}
