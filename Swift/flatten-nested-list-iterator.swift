/**
 * https://leetcode.com/problems/flatten-nested-list-iterator/
 * 
 * 
 */ 
// Date: Tue Apr 13 20:16:35 PDT 2021

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {

    var index: Int
    var list: [Int]
    
    init(_ nestedList: [NestedInteger]) {
        self.index = 0
        self.list = []
        for list in nestedList {
            self.list += flat(list)
        }
    }
    
    private func flat(_ list: NestedInteger) -> [Int] {
        if list.isInteger() { return [list.getInteger()] }
        var result: [Int] = []
        for element in list.getList() {
            result += flat(element)
        }
        return result
    }
    
    func next() -> Int {
        let element = self.list[self.index]
        self.index += 1
        return element
    }
    
    func hasNext() -> Bool {
        return index < self.list.count
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */