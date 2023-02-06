//
//  APIManager.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// The API Manager is currently not used in the project.

class APIManager {
    // Manage the possible errors from the request.
    enum APIError: Error {
        case wrongURL
        case badResponse
        case noData
    }
    // Request data from an URL.
    func getRequest<M: Codable>(url: String,
                                cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
                                model: M.Type) async throws -> M {
        guard let url = URL(string: url) else { throw APIError.wrongURL }
        var request = URLRequest(url: url, cachePolicy: cachePolicy)
        request.httpMethod = "GET"
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else { throw APIError.badResponse}
            let result = try JSONDecoder().decode(M.self, from: data)
            return result
        } catch {
            throw APIError.noData
        }
    }
    static let superHeroToken = "10230860682846016"
}
