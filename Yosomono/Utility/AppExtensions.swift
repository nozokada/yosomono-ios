//
//  AppExtensions.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/18/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation
import FirebaseAuth

extension AuthErrorCode {
    func getError() -> AuthError {
        switch self {
        case .emailAlreadyInUse:
            return AuthError.emailAlreadyInUse
        case .userDisabled:
            return AuthError.userDisabled
        case .invalidEmail:
            return AuthError.invalidEmail
        case .wrongPassword:
            return AuthError.wrongPassword
        case .userNotFound:
            return AuthError.userNotFound
        case .networkError:
            return AuthError.networkError
        case .weakPassword:
            return AuthError.weakPassword
        case .internalError:
            return AuthError.internalError
        default:
            return AuthError.unknownError
        }
    }
}
