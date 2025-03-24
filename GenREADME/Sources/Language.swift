//
//  Language.swift
//  GenREADME
//
//  Created by Antonio081014 on 2025-03-23.
//

import Foundation

enum Language {
    case Swift
    case Java
    case Python
    
    var extensionString: String {
        switch self {
        case .Swift:
            return "swift"
        case .Java:
            return "java"
        case .Python:
            return "py"
        }
    }
    
    var description: String {
        switch self {
        case .Swift:
            "Swift"
        case .Java:
            "Java"
        case .Python:
            "Python"
        }
    }
}
