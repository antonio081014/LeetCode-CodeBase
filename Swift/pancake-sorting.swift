/**
 * https://leetcode.com/problems/pancake-sorting/
 * 
 * 
 */ 
// Date: Sat Aug 29 16:22:37 PDT 2020
class Solution {
    /// From the largest number to smallest one,
    /// Try to find the number and flip it to the front.
    /// Then, make another flip to make it to the right position.
    ///
    /// - Complexity:
    ///     - Time: O(n^2), n is the number of elements in A.
    ///     - Space: O(n)
    func pancakeSort(_ A: [Int]) -> [Int] {
        var A = A
        var result: [Int] = []
        for num in stride(from: A.count, through: 1, by: -1) {
            for index in 0 ..< A.count {
                if num == A[index] {
                    print("\(index)")
                    if num != index + 1 {
                        self.flip(&A, by: index)
                        result.append(index + 1)
                        self.flip(&A, by: num - 1)
                        result.append(num)
                    }
                    break
                }
            }
        }
        return result
    }
    
    private func flip(_ A: inout [Int], by k: Int) {
        var left = 0
        var right = k
        while left < right {
            let tmp = A[left]
            A[left] = A[right]
            A[right] = tmp
            left += 1
            right -= 1
        }
    }
}