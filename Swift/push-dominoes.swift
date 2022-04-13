class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var op = [(Int, String)]()
        op.append((-1, "L"))
        for (index, c) in dominoes.enumerated() {
            let text = String(c)
            if text != "." {
                op.append((index, text))
            }
        }
        op.append((dominoes.count, "R"))
        var result = Array(dominoes)
        for index in stride(from: 1, to: op.count, by: 1) {
            var (start, t1) = op[index - 1]
            var (end, t2) = op[index]
            if t1 == t2 {
                for idx in stride(from: start + 1, to: end, by: 1) {
                    result[idx] = Character(t1)
                }
            } else if t1 + t2 == "RL" {
                start += 1
                end -= 1
                while start <= end {
                    if start == end {
                        result[start] = Character(".")
                    } else {
                        result[start] = Character("R")
                        result[end] = Character("L")
                    }
                    start += 1
                    end -= 1
                }
            }
        }
        return String(result)
    }
}
