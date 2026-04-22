//
//  Config.swift
//  Grocery Management
//
//  Created by mac on 20/05/2025.
//

import Foundation

let SDK_API_BASE_URL_PRODUCTION: String = ""
let SDK_API_BASE_URL_STAGING: String = "https://3e30-202-166-165-194.ngrok-free.app"

public enum SDKEnvironment {
    case production
    case staging
}

public protocol AppFeatures {
    
}

public protocol AppConfiguration {
    var features: AppFeatures { get set }
    var api: String { get set }
}

public struct DefaultAppFeatures: AppFeatures {
    public var audioClasses: Bool
    
    public init(audioClasses: Bool = true) {
        self.audioClasses = audioClasses
    }
}

struct DefaultSDKConfiguration: AppConfiguration {
    var features: AppFeatures
    var api: String
    
    init() {
        self.features = DefaultAppFeatures()
        self.api = SDK_API_BASE_URL_PRODUCTION
    }
}


public class Config {
    public static let shared: Config = Config()
    
    private var _configuration: AppConfiguration
    
    private init() {
        self._configuration = DefaultSDKConfiguration()
    }
    
    public var configuration: AppConfiguration {
        get {
            return _configuration
        }
        set {
            _configuration = newValue
        }
    }

    public var features: AppFeatures {
        get {
            return _configuration.features
        }
        set {
            _configuration.features = newValue
        }
    }
    
    public var environment: SDKEnvironment {
        get {
            return _configuration.api == SDK_API_BASE_URL_STAGING ? .staging : .production
        }
        set {
            switch newValue {
            case .production:
                _configuration.api = SDK_API_BASE_URL_PRODUCTION
            case .staging:
                _configuration.api = SDK_API_BASE_URL_STAGING
            }
        }
    }

    /**
     * @deprecated Use configuration getter instead
    **/
    @available(*, deprecated, message: "Use configuration getter property instead")
    public func getConfiguration() -> AppConfiguration {
        return _configuration
    }

    @available(*, deprecated, message: "Use configuration setter property instead")
    public func setConfiguration(configuration: AppConfiguration) {
        _configuration = configuration
    }
}
