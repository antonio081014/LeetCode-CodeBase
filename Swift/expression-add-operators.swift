class Solution {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var result = [String]()
        
        let num = Array(num)
        
        func dfs(_ path: String, _ currentIndex: Int, _ value: Int, _ lastValue: Int) {
            if currentIndex == num.count {
                if value == target {
                    result.append(path)
                }
                return
            }
            
            var sum = 0
            for index in currentIndex ..< num.count {
                if num[currentIndex] == Character("0"), index != currentIndex {
                    return
                }
                sum = sum * 10 + Int(String(num[index]))!
                if currentIndex == 0 {
                    dfs(path + "\(sum)", index + 1, sum, sum)
                } else {
                    dfs(path + "+\(sum)", index + 1, value + sum, sum)
                    dfs(path + "-\(sum)", index + 1, value - sum, -sum)
                    dfs(path + "*\(sum)", index + 1, value - lastValue + lastValue * sum, lastValue * sum)
                }
            }
            
        }
        dfs("", 0, 0, 0)
        return result
    }
}
