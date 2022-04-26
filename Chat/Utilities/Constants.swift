//
//  Constants.swift
//  Chat
//
//  Created by MacService on 20.04.2022.
//

import Firebase

let COLLECTION_PERSONS = Firestore.firestore().collection("persons")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
let MOCK_PERSON = Person(id: "12", email: "mock@apple", fullname: "Mock", username: "Person", profileImageUrl: "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg")
