class Solution {
    func sum(_ num1: Int, _ num2: Int) -> Int {
        if num2 == 0 { return num1 }
        return sum(num1 ^ num2, (num1 & num2) << 1)
    }
}
