class Solution {
    private let LESS_THAN_20 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    private let TENS = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]

    func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero" }
        return helper(num).filter { $0.count > 0 }.joined(separator: " ")
    }
    
    private func helper(_ num: Int) -> [String] {
        if num < 20 { return [LESS_THAN_20[num]] }
        if num < 100 { return [TENS[num / 10]] + helper(num % 10) }
        if num < 1000 { return helper(num / 100) + ["Hundred"] + helper(num % 100) }
        if num < 1000000 { return helper(num / 1000) + ["Thousand"] + helper(num % 1000) }
        if num < 1000000000 {
            return helper(num / 1000000) + ["Million"] + helper(num % 1000000)
        }
        return helper(num / 1000000000) + ["Billion"] + helper(num % 1000000000)
    }
}
