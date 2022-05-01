class Solution {
    func removeDigit(_ number: String, _ digit: Character) -> String {
        var num = Array(number)
        for (index, c) in number.enumerated() {
            if c == digit, index < num.count - 1, num[index + 1] > c {
                num.remove(at: index)
                return String(num)
            }
        }
        for index in stride(from: number.count - 1, through: 0, by: -1) {
            if num[index] == digit {
                num.remove(at: index)
                return String(num)
            }
        }
        return ""
    }
}
