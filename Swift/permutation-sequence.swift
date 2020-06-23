/**
 * https://leetcode.com/problems/permutation-sequence/
 * 
 * 
 */ 
// Date: Tue Jun 23 08:41:22 PDT 2020
class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var  prod = 1
        var k = k
        var factorial = [1]
        var numbers = [Int]()
        for num in 1 ... n {
            prod *= num
            factorial.append(prod)
            numbers.append(num)
        }

        var ret = ""

        for num in 1 ... n {
            let index = (k - 1) / factorial[n - num]
            // print("\(num) : \(index)")
            ret += String(numbers[index])
            numbers.remove(at: index)
            k -= factorial[n - num] * index
            // print(numbers)
            // print("k: \(k)")
        }

        return ret
    }
}
