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
    func getDescription(error: Error) -> String {
        switch self {
        case .emailAlreadyInUse:
            return "このメールアドレスはすでに使用されています"
        case .userDisabled:
             return "サービスの利用が停止されています"
        case .invalidEmail:
             return "メールアドレスの形式が正しくありません"
        case .wrongPassword:
             return "メールアドレスまたはパスワードが違います"
        case .userNotFound:
             return "メールアドレスまたはパスワードが違います"
        case .networkError:
             return "ネットワーク接続に失敗しました"
        case .weakPassword:
             return "パスワードは6文字以上にしてください"
        case .internalError:
             return "エラーが発生しました。しばらく時間をおいて再度お試しください"
        default:
            return error.localizedDescription
        }
    }
}
