//
//  AuthError.swift
//  Yosomono
//
//  Created by Nozomi Okada on 9/22/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation

enum AuthError: Error {
    case emailAlreadyInUse
    case userDisabled
    case invalidEmail
    case wrongPassword
    case userNotFound
    case networkError
    case weakPassword
    case internalError
    case unknownError
}

extension AuthError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emailAlreadyInUse:
            return NSLocalizedString("emailAlreadyInUse", comment: "The email address is already in use")
        case .userDisabled:
            return NSLocalizedString("userDisabled", comment: "The user is disabled")
        case .invalidEmail:
             return NSLocalizedString("invalidEmail", comment: "The email address is invalid")
        case .wrongPassword:
            return NSLocalizedString("wrongPassword", comment: "The password is invalid")
        case .userNotFound:
            return NSLocalizedString("userNotFound", comment: "The user is not found")
        case .networkError:
            return NSLocalizedString("networkError", comment: "Internal error occurred")
        case .weakPassword:
            return NSLocalizedString("weakPassword", comment: "Password is too weak")
        case .internalError:
            return NSLocalizedString("internalError", comment: "Internal error occurred")
        case .unknownError:
            return NSLocalizedString("unknownError", comment: "Unknown error occurred")
        }
    }
}
