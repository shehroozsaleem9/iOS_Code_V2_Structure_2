//
//  AuthService.swift
//  Grocery Management
//
//  Created by mac on 19/05/2025.
//
import Alamofire

struct AuthService {
    static func login(
        email: String,
        password: String,
        completion: @escaping (Result<(LoginResponse, [AnyHashable : Any]), APIError>) -> Void
    ) {
        APIClient.shared.request(
            APIRouter.login(email: email, password: password),
            responseType: LoginResponse.self,
            completion: completion
        )
    }
    
    static func register(
        user_name : String,
        email: String,
        password: String,
        password_confirmation: String,
        completion: @escaping (Result<(RegistrationResponse, [AnyHashable : Any]), APIError>) -> Void
    ) {
        APIClient.shared.request(
            APIRouter.register(user_name: user_name, email: email, password: password, password_confirmation: password_confirmation),
            responseType: RegistrationResponse.self,
            completion: completion
        )
    }
    
}
