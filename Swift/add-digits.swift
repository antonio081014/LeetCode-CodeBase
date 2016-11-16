class Solution {
    func addDigits(_num: Int) -> Int {
        var num = _num
        var count = 0
        repeat {
            var sum = 0
            count = 0
            while num > 0 {
                sum += num % 10
                num /= 10
                count += 1
            }
            num = sum
        } while count > 1
        return num
    }
    
    func addDigits(_num: Int) -> Int {
        var num = _num
        var sum = 0
        var count = 0
        while num > 0 {
            sum += num % 10
            num /= 10
            count += 1
        }
        if count <= 1 {
            return sum
        }
        return addDigits(sum)
    }
}
