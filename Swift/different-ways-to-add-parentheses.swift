class Solution {
    /// - Complexity: 
    ///     - Time: O(2 ^ n), n = number of operator in expression. Since, at each operator, we could split the expr there or not.
    ///     - Space: O(m), m = possible result for current expression.
    
    func diffWaysToCompute(_ expression: String) -> [Int] {
        if let num = Int(expression) {
            return [num]
        }
        
        var result = [Int]()
        for index in expression.indices {
            if "+-*".contains(expression[index]) {
                let left = diffWaysToCompute(String(expression[..<index]))
                let right = diffWaysToCompute(String(expression[expression.index(after: index) ..< expression.endIndex]))
                if expression[index] == Character("+") {
                    for l in left {
                        for r in right {
                            result.append(l + r)
                        }
                    }
                } else if expression[index] == Character("-") {
                    for l in left {
                        for r in right {
                            result.append(l - r)
                        }
                    }
                } else if expression[index] == Character("*") {
                    for l in left {
                        for r in right {
                            result.append(l * r)
                        }
                    }
                } 
            }
        }
        // print(expression, result)
        return result
    }
}



class Solution {
    /// Recursive solution with memorization.
    
    private var memo: [String : [Int]]!
    func diffWaysToCompute(_ expression: String) -> [Int] {
        memo = [String : [Int]]()
        
        return helper(expression)
    }
    
    private func helper(_ expression: String) -> [Int] {
        if let ret = self.memo[expression] { return ret }
        if let num = Int(expression) {
            return [num]
        }
        
        var result = [Int]()
        for index in expression.indices {
            if "+-*".contains(expression[index]) {
                let left = diffWaysToCompute(String(expression[..<index]))
                let right = diffWaysToCompute(String(expression[expression.index(after: index) ..< expression.endIndex]))
                if expression[index] == Character("+") {
                    for l in left {
                        for r in right {
                            result.append(l + r)
                        }
                    }
                } else if expression[index] == Character("-") {
                    for l in left {
                        for r in right {
                            result.append(l - r)
                        }
                    }
                } else if expression[index] == Character("*") {
                    for l in left {
                        for r in right {
                            result.append(l * r)
                        }
                    }
                } 
            }
        }
        self.memo[expression] = result
        return result
    }
}
