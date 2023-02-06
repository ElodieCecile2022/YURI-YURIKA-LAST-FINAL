//
//  BundleExtension.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import Foundation

extension Bundle {
    // Manage the errors of the JSON request
    enum BundleError: Error { case wrongURL, noData, wrongData }
    // Decode a JSON file to read his data
    func decode<T: Codable>(_ resource: String) throws -> T {
        guard let url = Bundle.main.url(forResource: resource, withExtension: nil) else {
            throw BundleError.wrongURL
        }
        guard let data = try? Data(contentsOf: url) else { throw BundleError.noData }
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw BundleError.wrongData
        }
        return decodedData
    }
}
