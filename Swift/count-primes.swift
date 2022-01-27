class Solution {
    func countPrimes(_ n: Int) -> Int {
        let nonprimeList = self.primeIndicator(n)
        var count = 0
        // for x in stride(from: 2, to: n, by: 1) {
        //     if nonprimeList.contains(x) == false {
        //         // print(x)
        //         count += 1
        //     }
        // }
        for x in stride(from: 2, to: n, by: 1) {
            if nonprimeList[x] == false {
                // print(x)
                count += 1
            }
        }
        return count
    }
    
    private func primeIndicator(_ n: Int) -> [Bool] {
        if n < 1 { return [] }
        var result = Array(repeating: false, count: n)
        result[0] = true
        if n > 1 {
            result[1] = true
        }
        for x in stride(from: 2, to: n, by: 1) {
            if result[x] == false {
                var multiple = 2
                while multiple * x < n {
                    result[multiple * x] = true
                    multiple += 1
                }
            }
        }
        return result
    }
    
    private func nonprime(_ n: Int) -> Set<Int> {
        var result = Set<Int>()
        if n > 1 {
            result.insert(1)
        }
        for x in stride(from: 2, to: n, by: 1) {
            if result.contains(x) == false {
                var multiple = x * x
                while multiple < n {
                    result.insert(multiple)
                    multiple += x
                }
            }
        }
        // print(result)
        return result
    }
}
