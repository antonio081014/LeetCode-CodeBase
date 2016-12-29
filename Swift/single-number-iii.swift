/**
 * https://leetcode.com/problems/single-number-iii/
 * 
 * 
 */ 
// None of the following code passed.
// TLE error on the last set of test case.
func singleNumber(_ nums: [Int]) -> [Int] {
    return nums.reduce([Int: Int](), {
        var dict = $0
        if dict[$1] == nil {
            dict[$1] = 1
        } else {
            dict[$1] = 1 + dict[$1]!
        }
        return dict
    }).reduce([Int](), {
        list, dict in (dict.value % 2 == 0 ? list : list + [dict.key])
    })
}

print("\(singleNumber([1, 2, 1, 3, 2, 5]))")

func singleNumber1(_ nums: [Int]) -> [Int] {
    return nums.reduce([Int: Int](), {
        var dict = $0
        if dict[$1] == nil {
            dict[$1] = 1
        } else {
            dict[$1] = 1 + dict[$1]!
        }
        return dict
    }).filter(
        {$1 % 2 != 0}
        ).map(
            {key, value in key}
    )
}

print("\(singleNumber1([1, 2, 1, 3, 2, 5]))")

func singleNumber2(_ nums: [Int]) -> [Int] {
    return nums.reduce([Int: Int](), {
        var dict = $0
        if dict[$1] == nil {
            dict[$1] = 1
        } else {
            dict[$1] = 1 + dict[$1]!
        }
        return dict
    }).flatMap{key, value in (value % 2 == 0 ? nil : key)}
}
