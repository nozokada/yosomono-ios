//
//  AuthenticationState.swift
//  Yosomono
//
//  Created by Nozomi Okada on 9/19/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation
import Firebase

class AuthenticationState: ObservableObject {

    @Published var loggedInUser: User?
    @Published var isAuthenticating = false
    @Published var error: NSError?

    static let shared = AuthenticationState()

    private let auth = Auth.auth()
    private let userCollection = Firestore.firestore().collection(Constants.CollectionNames.users)

    func signIn(with signInOption: SignInOption) {
        isAuthenticating = true
        error = nil

        switch signInOption {
        case let .signInWithEmailAndPassword(email, password):
            handleSignInWith(email: email, password: password)
        }
    }

    func signUp(email: String, password: String, username: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            guard let user = authResult?.user else {
                #if DEBUG
                print("Failed to create user with email \(email)")
                #endif
                if let error = error {
                    self.error = error as NSError
                }
                self.isAuthenticating = false
                return
            }
            #if DEBUG
            print("Successfully created user with email \(email)")
            #endif
            self.changeDisplayName(user: user, username: username)
            self.createUserData(user: user)
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            loggedInUser = nil
        } catch let error as NSError {
            self.error = error
        }
    }

    func changeDisplayName(user: User, username: String) {
        let changeRequest = user.createProfileChangeRequest()
        changeRequest.displayName = username
        changeRequest.commitChanges { error in
            if let error = error {
                #if DEBUG
                print("Failed to add display name \(username): \(error.localizedDescription)")
                #endif
            }
            #if DEBUG
            print("Successfully added display name \(username)")
            #endif
        }
    }

    func createUserData(user: User) {
        let username = user.displayName ?? user.uid
        userCollection.document(user.uid).setData([
            Constants.FieldNames.username : username,
            Constants.FieldNames.createdAt : FieldValue.serverTimestamp()
        ]) { error in
            if let error = error {
                #if DEBUG
                print("Failed to add user data for \(username): \(error.localizedDescription)")
                #endif
                return
            }
            #if DEBUG
            print("Successfully added user data for \(username)")
            #endif
        }
    }
}

extension AuthenticationState {
    enum SignInOption {
        case signInWithEmailAndPassword(String, String)
    }
}

extension AuthenticationState {
    private func handleSignInWith(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                #if DEBUG
                print("Failed to sign in")
                #endif
                self.error = error as NSError
            } else {
                #if DEBUG
                print("Successfully signed in")
                #endif
                self.loggedInUser = self.auth.currentUser
            }
            self.isAuthenticating = false
        }
    }

    private func getAuthErrorMessage(_ error: Error) -> String {
        let error = error as NSError
        var message = error.localizedDescription
        if let authErrorCode = AuthErrorCode(rawValue: error.code) {
            message = authErrorCode.getDescription(error: error)
        }
        return message
    }
}
