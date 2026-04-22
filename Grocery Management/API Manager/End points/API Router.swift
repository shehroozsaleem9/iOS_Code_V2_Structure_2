//
//  API Router.swift
//  Grocery Management
//
//  Created by mac on 19/05/2025.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    case login(email: String, password: String)
    case register( user_name : String, email : String ,  password: String , password_confirmation : String)
    case getItems
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .getItems: return .get
        case .register: return .post
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .login: return "/auth/sign_in"
        case .register: return "/auth"
        case .getItems: return "/items"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return ["email": email, "password": password]
        case .register(let user_name, let email , let password, let password_confirmation):
            return ["email": email, "password": password , "password_confirmation" : password_confirmation , "user_name" : user_name]
        default: return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let baseURL = Config.shared.configuration.api
        let fullPath = baseURL +  path
        let url = URL(string: fullPath )
      
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = TokenManager.shared.token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get: return URLEncoding.default
            default: return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
