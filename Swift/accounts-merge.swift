/**
 * https://leetcode.com/problems/accounts-merge/
 * 
 * 
 */ 
// Date: Mon Mar  7 19:55:15 PST 2022
class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var email2Name: [String : String] = [:]
        var unionset = UnionFindWeightedQuickUnionPathCompression<String>()
        for account in accounts {
            let name = account[0]
            for index in 1 ..< account.count {
                email2Name[account[index]] = name
                unionset.addSet(with: account[index])
                unionset.unionSetsContaining(account[1], and: account[index])
            }
        }
        
        var result: [Int : Set<String>] = [:]
        for email in email2Name.keys {
            let parentID = unionset.findSetParentIndex(of: email)!
            var list = result[parentID, default: []]
            list.insert(email)
            result[parentID] = list
        }
        return result.values.map { list in
                           let sortedList = list.sorted()
                           return [email2Name[sortedList[0], default: ""]] + sortedList
                          }
    }
}



public struct UnionFindWeightedQuickUnionPathCompression<T: Hashable> {
    /// Map hashable element to set index.
    private var mapOfElement2SetIndex: [T: Int]
    /// Parent Set Index of current set.
    private var setParentIndex: [Int]
    /// Size of each set.
    private var setSize: [Int]

    /// Init
    public init() {
        self.mapOfElement2SetIndex = [:]
        self.setParentIndex = []
        self.setSize = []
    }

    /// Add a new set with a new element
    /// - Complexity:
    ///     - Time: very close, but not O(1)
    public mutating func addSet(with element: T) {
        /// Dont add it, if it already exists.
        if self.findSetParentIndex(of: element) != nil { return }
        self.mapOfElement2SetIndex[element] = self.setParentIndex.count
        self.setParentIndex.append(self.setParentIndex.count)
        self.setSize.append(1)
    }

    /// Path Compression.
    private mutating func lookupParentSetIndexForSet(with index: Int) -> Int {
        if index != setParentIndex[index] {
            setParentIndex[index] = lookupParentSetIndexForSet(with: setParentIndex[index])
        }
        return setParentIndex[index]
    }

    /// Find the Set Index of element.
    /// - Complexity:
    ///     - Time: very close, but not O(1)
    public mutating func findSetParentIndex(of element: T) -> Int? {
        if let indexOfElement = mapOfElement2SetIndex[element] {
            return lookupParentSetIndexForSet(with: indexOfElement)
        } else {
            return nil
        }
    }

    /// Union two elements into one set.
    ///
    /// Generally make two share the same parent set index.
    /// - Complexity:
    ///     - Time: very close, but not O(1)
    public mutating func unionSetsContaining(_ firstElement: T, and secondElement: T) {
        if let firstSet = findSetParentIndex(of: firstElement), let secondSet = findSetParentIndex(of: secondElement) {
            if firstSet != secondSet {
                if setSize[firstSet] < setSize[secondSet] {
                    setParentIndex[firstSet] = secondSet
                    setSize[secondSet] += setSize[firstSet]
                } else {
                    setParentIndex[secondSet] = firstSet
                    setSize[firstSet] += setSize[secondSet]
                }
            }
        }
    }

    /// Return if two elements are in the same set.
    /// - Complexity:
    ///     - Time: very close, but not O(1)
    public mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
        if let firstSet = findSetParentIndex(of: firstElement), let secondSet = findSetParentIndex(of: secondElement) {
            return firstSet == secondSet
        } else {
            return false
        }
    }
}