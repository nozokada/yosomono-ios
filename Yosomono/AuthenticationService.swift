//
//  AuthenticationService.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/17/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthenticationService: ObservableObject {
    
    @Published var currentUser: User?
    
    init() {
        currentUser = Auth.auth().currentUser
    }
    
    func createUser(email: String, password: String, username: String, completion: @escaping (Bool, String?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let user = authResult?.user else {
                #if DEBUG
                print("User creation for \(email) was failed")
                #endif
                if let error = error {
                    completion(false, self.getAuthErrorMessage(error))
                }
                return
            }
            #if DEBUG
            print("User creation for \(email) was successful")
            #endif
            self.changeDisplayName(user: user, username: username) {
                self.createUserData(user: user) {
                    self.currentUser = user
                    completion(true, nil)
                }
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Bool, String?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                #if DEBUG
                print("Sign in failed")
                #endif
                completion(false, self.getAuthErrorMessage(error))
            } else {
                #if DEBUG
                print("Sign in succeeded")
                #endif
                self.currentUser = Auth.auth().currentUser
                completion(true, nil)
            }
        }
    }
    
    func signOut(completion: ((Bool, String?) -> ())? = nil) {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            completion?(true, nil)
        }
        catch let error as NSError {
            completion?(false, getAuthErrorMessage(error))
        }
    }
    
    func sendPasswordReset(to email: String, completion: @escaping (Bool, String?) -> ()) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                #if DEBUG
                print("Password reset email was not sent to \(email)")
                #endif
                completion(false, self.getAuthErrorMessage(error))
            } else {
                #if DEBUG
                print("Password reset email was successfully sent to \(email)")
                #endif
                completion(true, nil)
            }
        }
    }
    
    fileprivate func changeDisplayName(user: User, username: String, completion: (() -> ())? = nil) {
        let changeRequest = user.createProfileChangeRequest()
        changeRequest.displayName = username
        changeRequest.commitChanges() { error in
            if let error = error {
                #if DEBUG
                print("Display name \(username) was not added: \(error.localizedDescription)")
                #endif
            }
            #if DEBUG
            print("Display name \(username) was successfully added")
            #endif
            completion?()
        }
    }
    
    fileprivate func createUserData(user: User, completion: (() -> ())? = nil) {
        let username = user.displayName ?? user.uid
        Firestore.firestore().collection(Constants.CollectionNames.users).document(user.uid).setData([
            Constants.FieldNames.username : username,
            Constants.FieldNames.createdAt : FieldValue.serverTimestamp()
        ]) { error in
            if let error = error {
                #if DEBUG
                print("User data for \(username) was not added: \(error.localizedDescription)")
                #endif
                return
            }
            #if DEBUG
            print("User data for \(username) was successfully added")
            #endif
            completion?()
        }
    }
    
    fileprivate func getAuthErrorMessage(_ error: Error) -> String {
        let error = error as NSError
        var message = error.localizedDescription
        if let authErrorCode = AuthErrorCode(rawValue: error.code) {
            message = authErrorCode.getDescription(error: error)
        }
        return message
    }
}

