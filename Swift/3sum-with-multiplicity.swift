class Solution {
    /// - Complexity:
    ///     - Time: O(nlogn + m * m), where n = arr.count, m is the number of unique keys in arr.
    ///     - Space: O(m), m is the number of unique keys in arr.
    func threeSumMulti(_ arr: [Int], _ target: Int) -> Int {
        let MOD = 1_000_000_007
        
        var count = [Int : Int]()
        for c in arr {
            count[c, default: 0] += 1
        }
        
        let keys = count.keys.sorted()
        var result = 0
        let n = keys.count
        for index in 0 ..< n {
            var left = index + 1
            var right = n - 1
            let sum = target - keys[index]
            /// Case: x < y <= z
            while left <= right {
                if keys[left] + keys[right] < sum {
                    left += 1
                } else if keys[left] + keys[right] > sum {
                    right -= 1
                } else {
                    if left != right {
                        result += (count[keys[index], default: 0] * count[keys[left], default: 0] * count[keys[right], default: 0]) % MOD
                        result %= MOD
                    } else {
                        let c = count[keys[left], default: 0]
                        result += (count[keys[index], default: 0] * (c) * (c - 1) / 2) % MOD
                        result %= MOD
                    }
                    left += 1
                    right -= 1
                }
            }
            
            let leftover = target - keys[index] - keys[index]
            /// Case: first two elements are the same, 3rd element is a larger number.
            if leftover > keys[index] {
                let c = count[keys[index], default: 0]
                result += (count[leftover, default: 0] * (c) * (c - 1) / 2) % MOD
                result %= MOD
            }
            /// Case: all 3 number are identical.
            if leftover == keys[index] {
                let c = count[keys[index], default: 0]
                result += ((c) * (c - 1) * (c - 2) / 6) % MOD
                result %= MOD
            }
            // print(keys[index], sum, result)
        }
        return result
    }
}
