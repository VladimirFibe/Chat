//
//  SelectGroupMembersViewModdel.swift
//  Chat
//
//  Created by MacService on 19.05.2022.
//

import Firebase

class SelectGroupMembersViewModel: ObservableObject {
  @Published var selectablePersons = [SelectablePerson]()
  var selectedPersons: [SelectablePerson] {
    selectablePersons.filter { $0.isSelected }
  }
  init() {
    fetchPesons()
  }
  
  func fetchPesons() {
    // TODO: - Можно ли отфильтровать текущего пользователя на стороне firebase?
    COLLECTION_PERSONS.getDocuments { snapshot, error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      guard let uid = Auth.auth().currentUser?.uid else { return }
      guard let documents = snapshot?.documents else { return }
      let persons = documents
        .compactMap({ try? $0.data(as: Person.self)})
        .filter({ $0.id != uid })
      self.selectablePersons = persons.map({ SelectablePerson(person: $0) })
    }
  }
  
  func selectPerson(_ person: SelectablePerson) {
    guard let index = selectablePersons.firstIndex(where: { $0.id == person.id }) else { return }
    selectablePersons[index].isSelected.toggle()
  }
  
  func filteredPersons(_ query: String) -> [SelectablePerson] {
    let lowercasedQuery = query.lowercased()
    return selectablePersons.filter { $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery)}
  }
}
