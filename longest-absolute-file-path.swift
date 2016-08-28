class Solution {
    func lengthLongestPath(input: String) -> Int {
        let text = input + "\n"
        var maxL = 0
        var pathLengthCounter = [Int]()
        var count = 0
        var level = 0
        var hasDot = false
        
        for c in text.characters {
            if c == "\n" {
                while pathLengthCounter.count > level {
                    pathLengthCounter.removeLast()
                }
                pathLengthCounter.append(count + 1 + (pathLengthCounter.last ?? 0))
                if hasDot {
                    maxL = max(maxL, pathLengthCounter.last! - 1)
                }
                count = 0
                level = 0
                hasDot = false
            } else if c == "\t" {
                level += 1
            } else {
                count += 1
                if c == "." {
                    hasDot = true
                }
            }
        }
        return maxL
    }
}