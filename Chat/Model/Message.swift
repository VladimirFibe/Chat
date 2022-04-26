//
//  Message.swift
//  Chat
//
//  Created by Vladimir Fibe on 18.04.2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
  @DocumentID var id: String?
  var text: String
  var from: String
  var to: String
  var read: Bool
  var timestamp: Timestamp?
//  static let messages = [
//    Message(me: true, text: "Привет! Как ты?"),
//    Message(me: false, text: "Здорово! У меня все хорошо! Как у тебя"),
//    Message(me: true, text: "И у меня ничего... совсем ничего:)"),
//    Message(me: false, text: "Ты устроился на работу?"),
//    Message(me: true, text: "Нет еще, сегодня иду на собеседовани"),
//    Message(me: false, text: "Удачи!"),
//    Message(me: true, text: "Спасибо")
//  ]
}
