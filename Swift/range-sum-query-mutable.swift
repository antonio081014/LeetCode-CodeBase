/**
 * https://leetcode.com/problems/range-sum-query-mutable/
 * 
 * 
 */ 
// Date: Sat Jun 19 07:59:22 PDT 2021

class NumArray {

    private var segTree: [Int]
    
    /// O(n)
    init(_ nums: [Int]) {
        let n = nums.count
        segTree = Array(repeating: 0, count: n * 2)
        for index in 0 ..< nums.count {
            segTree[index + n] = nums[index]
        }
        for index in stride(from: n - 1, to: 0, by: -1) {
            segTree[index] = segTree[index * 2] + segTree[index * 2 + 1]
        }
    }
    
    /// O(logn)
    func update(_ index: Int, _ val: Int) {
        var spot = index + segTree.count / 2
        self.segTree[spot] = val
        while spot > 0 {
            let left = spot % 2 == 0 ? spot : spot - 1
            let right = spot % 2 == 0 ? spot + 1 : spot
            self.segTree[spot / 2] = self.segTree[left] + self.segTree[right]
            spot /= 2
        }
    }
    
    /// O(logn)
    /// because on each iteration of the algorithm we move one level up, 
    /// either to the parent of the current node or to the next sibling of parent to the left or right direction till the two boundaries meet. 
    /// In the worst-case scenario this happens at the root after logn iterations of the algorithm.
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var l = left + self.segTree.count / 2
        var r = right + self.segTree.count / 2
        var sum = 0
        while l <= r {
            if l % 2 == 1 {
                sum += self.segTree[l]
                l += 1
            }
            if r % 2 == 0 {
                sum += self.segTree[r]
                r -= 1
            }
            l /= 2
            r /= 2
        }
        return sum
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */