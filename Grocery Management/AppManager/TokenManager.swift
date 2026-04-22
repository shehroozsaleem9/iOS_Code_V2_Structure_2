//
//  TokenManager.swift
//  Grocery Management
//
//  Created by mac on 20/05/2025.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()
    
    private let tokenKey = "auth_token"
    private let clientKey = "auth_client"
    private let uidKey = "auth_uid"

    private init() {}

    var token: String? {
        get { UserDefaults.standard.string(forKey: tokenKey) }
        set { UserDefaults.standard.set(newValue, forKey: tokenKey) }
    }

    var client: String? {
        get { UserDefaults.standard.string(forKey: clientKey) }
        set { UserDefaults.standard.set(newValue, forKey: clientKey) }
    }

    var uid: String? {
        get { UserDefaults.standard.string(forKey: uidKey) }
        set { UserDefaults.standard.set(newValue, forKey: uidKey) }
    }

    func save(token: String?, client: String?, uid: String?) {
        self.token = token
        self.client = client
        self.uid = uid
    }

    func clear() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
        UserDefaults.standard.removeObject(forKey: clientKey)
        UserDefaults.standard.removeObject(forKey: uidKey)
    }
}


