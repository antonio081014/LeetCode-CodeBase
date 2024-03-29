
//
//  Heap.swift
//
//  Created by Yi Ding on 9/30/19.
//  Copyright © 2019 Yi Ding. All rights reserved.
//

import Foundation

public struct Heap<T> {
    
    /** The array that stores the heap's nodes. */
    private(set) var nodes: [T]
    
    /**
     * Determines how to compare two nodes in the heap.
     * Use '>' for a max-heap or '<' for a min-heap,
     * or provide a comparing method if the heap is made
     * of custom elements, for example tuples.
     */
    fileprivate let sortingComparator: (T, T) -> Bool
    
    /**
     * Creates an empty heap.
     * The sort function determines whether this is a min-heap or max-heap.
     * For comparable data types, > makes a max-heap, < makes a min-heap.
     */
    public init(sortingComparator: @escaping (T, T) -> Bool) {
        self.nodes = []
        self.sortingComparator = sortingComparator
    }
    
    /**
     * Creates a heap from an array. The order of the array does not matter;
     * the elements are inserted into the heap in the order determined by the
     * sort function. For comparable data types, '>' makes a max-heap,
     * '<' makes a min-heap.
     */
    public init(array: [T], sortingComparator: @escaping (T, T) -> Bool) {
        self.nodes = []
        self.sortingComparator = sortingComparator
        
        self.buildHeap(from: array)
    }
    
    /**
     * Configures the max-heap or min-heap from an array, in a bottom-up manner.
     * Performance: This runs pretty much in O(n).
     */
    private mutating func buildHeap(from array: [T]) {
        // self.insert(array)
        self.nodes = array
        for index in stride(from: array.count / 2 - 1, through: 0, by: -1) {
            self.shiftDown(from: index)
        }
    }
}

// MARK: - Peek, Insert, Remove, Replace
extension Heap {
    
    public var isEmpty: Bool {
        return self.nodes.isEmpty
    }
    
    public var count: Int {
        return self.nodes.count
    }
    
    /**
     * Returns the maximum value in the heap (for a max-heap) or the minimum
     * value (for a min-heap).
     * Performance: O(1)
     */
    public func peek() -> T? {
        return self.nodes.first
    }
    
    /**
     * Adds a new value to the heap. This reorders the heap so that the max-heap
     * or min-heap property still holds.
     * Performance: O(log n).
     */
    public mutating func insert(element: T) {
        self.nodes.append(element)
        self.shiftUp(from: self.nodes.count - 1)
    }
    
    /**
     * Adds a sequence of values to the heap. This reorders the heap so that
     * the max-heap or min-heap property still holds.
     * Performance: O(log n).
     */
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(element: value)
        }
    }
    
    /**
     * Allows you to change an element. This reorders the heap so that
     * the max-heap or min-heap property still holds.
     * Performance: O(log n)
     */
    public mutating func replace(at index: Int, value: T) {
        guard index < nodes.count else { return }
        
        remove(at: index)
        insert(element: value)
    }
    
    /**
     * Removes the root node from the heap. For a max-heap, this is the maximum
     * value; for a min-heap it is the minimum value.
     * Performance: O(log n).
     */
    @discardableResult public mutating func remove() -> T? {
        guard self.nodes.count > 0 else { return nil }
        if self.nodes.count == 1 {
            return self.nodes.removeLast()
        } else {
            let value = self.nodes.first
            self.nodes[0] = self.nodes.removeLast()
            self.shiftDown(from: 0)
            return value
        }
    }
    
    /**
     * Removes an arbitrary node from the heap.
     * Note that you need to know the node's index.
     * Performance: O(log n)
     */
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < self.count else { return nil }
        self.nodes.swapAt(index, self.nodes.count - 1)
        let value = self.nodes.removeLast()
        self.shiftDown(from: index)
        self.shiftUp(from: index)
        return value
    }
}

// MARK: - Index
extension Heap {
    
    /**
     * Returns the index of the parent of the element at index i.
     * The element at index 0 is the root of the tree and has no parent.
     * Performance: O(1)
     */
    func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    /**
     * Returns the index of the left child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no left child.
     * Performance: O(1)
     */
    func leftChildIndex(ofIndex index: Int) -> Int {
        return index * 2 + 1
    }
    
    /**
     * Returns the index of the right child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no right child.
     * Performance: O(1)
     */
    func rightChildIndex(ofIndex index: Int) -> Int {
        return index * 2 + 2
    }
}

// MARK: - Shift Up / Down
extension Heap {
    
    /**
     * Takes a child node and looks at its parents; if a parent is not larger
     * (max-heap) or not smaller (min-heap) than the child, we exchange them.
     * Performance: O(log n)
     */
    mutating func shiftUp(from index: Int) {
        var childIndex = index
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while parentIndex < childIndex, !self.sortingComparator(self.nodes[parentIndex], self.nodes[childIndex]) {
            self.nodes.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
    }
    
    /**
     * Looks at a parent node and makes sure it is still larger (max-heap) or
     * smaller (min-heap) than its childeren.
     * Performance: O(log n)
     */
    mutating func shiftDown(from index: Int) {
        let parentIndex = index
        let leftChildIndex = self.leftChildIndex(ofIndex: parentIndex)
        let rightChildIndex = self.rightChildIndex(ofIndex: parentIndex)
        
        var subIndex = parentIndex
        if leftChildIndex < self.nodes.count, self.sortingComparator(self.nodes[subIndex], self.nodes[leftChildIndex]) == false {
            subIndex = leftChildIndex
        }
        
        if rightChildIndex < self.nodes.count, self.sortingComparator(self.nodes[subIndex], self.nodes[rightChildIndex]) == false {
            subIndex = rightChildIndex
        }
        
        if parentIndex == subIndex { return }
        
        self.nodes.swapAt(subIndex, index)
        self.shiftDown(from: subIndex)
    }
}

extension Heap where T: Equatable {
    
    /**
     * Get the index of a node in the heap.
     * Performance: O(n).
     */
    public func index(of node: T) -> Int? {
        return self.nodes.firstIndex(of: node)
    }
    
    /**
     * Removes the first occurrence of a node from the heap.
     * Performance: O(n + log n) => O(n).
     */
    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = self.index(of: node) {
            return self.remove(at: index)
        }
        return nil
    }
}

class Solution {
    struct Edge: Comparable {
        let from: Int
        let to: Int
        let distance: Int
        
        // init(from: Int, to: Int, distance: Int) {
        //     self.from = min(from, to)
        //     self.to = max(from, to)
        //     self.distance = distance
        // }
        
        static func < (lhs: Solution.Edge, rhs: Solution.Edge) -> Bool {
            return lhs.distance < rhs.distance
        }
    }
    
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        var notVisited = Set(0 ..< n)
        var currentIndex = 0
        var minHeap = Heap<Edge>(sortingComparator: { $0 < $1 })
        var result = 0
        while notVisited.isEmpty == false {
            // print(currentIndex)
            notVisited.remove(currentIndex)
            for p in 0 ..< n {
                if notVisited.contains(p) {
                    minHeap.insert(element: Edge(from: currentIndex, to: p, distance: self.dist(points[currentIndex], points[p])))
                }
            }
            
            while let node = minHeap.peek(), notVisited.contains(node.to) == false {
                minHeap.remove()
            }
            
            if let node = minHeap.remove() {
                result += node.distance
                currentIndex = node.to
            } else {
                return result
            }
        }
        return result
    }
    
    private func dist(_ a: [Int], _ b: [Int]) -> Int {
        return abs(a[0] - b[0]) + abs(a[1] - b[1])
    }
}
