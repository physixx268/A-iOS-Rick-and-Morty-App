//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Jan Appé on 31.01.23.
//

import Foundation

/// Object the represents a single API call
final class RMRequest {
    // BASE url
    // Endpoint
    // Path Components
    
    /// API Constants
    private struct Constants {
        static let BaseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired Endpoint
    let endpoint: RMEndpoint
    
    let pathComponents: Set[String]
    
    let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.BaseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
       return string
    }
    
    /// Computed & Constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired HTTP Method
    public let httpMethod = "GET"
    
    /// Construct Request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: collection of path components
    ///   - queryParameters: collection of query paramets
    init(
        endpoint: RMEndpoint,
        pathComponents: Set[String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
