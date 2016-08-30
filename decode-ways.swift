class Solution {
    func numDecodings(s: String) -> Int {
        let array = Array(("0" + s).characters)
        let n = array.count
        if n <= 1 {
            return 0
        }
        var count = [Int](count: n, repeatedValue: 0)
        count[0] = 1
        for i in 1..<n {
            if array[i] == "0" {
                if i > 1 && (array[i-1]=="1" || array[i-1]=="2"){
                    count[i] = count[i-2]
                } else {
                    return 0
                }
            } else {
                count[i] = count[i-1]
                if array[i-1] == "1" || (array[i-1]=="2" && array[i] <= "6") {
                    count[i] += count[i-2]
                }
            }
        }
        return count[n-1]
    }
}
