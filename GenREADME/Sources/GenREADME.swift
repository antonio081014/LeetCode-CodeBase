// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct GenREADME: AsyncParsableCommand {
    mutating func run() async throws {
        
        let coreLogic = CoreLogic()
        try await coreLogic.coreFucntion()
    }
}
