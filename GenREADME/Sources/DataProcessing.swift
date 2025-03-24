//
//  DataProcessing.swift
//  GenREADME
//
//  Created by Antonio081014 on 2025-03-23.
//
import Foundation

enum GenError: Error {
    case invalidURL
    case networkError
    case dataError
}

struct DataProcessing {
    
    func importDataFromURL(_ url: String) async throws -> [String: Any] {
        guard let mURL = URL(string: url) else {
            print("Invalid URL: \(url)")
            throw GenError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: mURL)
            guard let json = convert2JSON(from: data) else { throw GenError.dataError }
            return json
        } catch {
            throw GenError.networkError
        }
    }

    private func convert2JSON(from data: Data) -> [String: Any]? {
        do {
            guard let todo = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                print("error trying to convert data to JSON")
                return nil
            }
            return todo
        } catch  {
            print("error trying to convert data to JSON")
            return nil
        }
    }
    
    func normalizeJSON(_ json: [String: Any]) throws -> [Problem] {
        var problemList = [Problem]()
        guard let list = json["stat_status_pairs"] as? [Any] else {
            print("Can't read list.")
            throw GenError.dataError
        }
        
        for case let item as [String: Any] in list {
            guard let info = item["stat"] as? [String: Any] else {
                print("Error: Invalid Problem Info.")
                continue
            }
            
            
            if let problem = Problem(json: info) {
                problemList.append(problem)
            } else {
                print("Error: Invalid Problem init?")
            }
            
        }
        
        //    problemList.sort(by: {return $0.seq > $1.seq})
        problemList.sort() {
            return $0.seq > $1.seq
        }
        
        return problemList
    }
}

