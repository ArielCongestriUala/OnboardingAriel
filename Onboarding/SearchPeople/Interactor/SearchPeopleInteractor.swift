import UIKit

class SearchPeopleInteractor: SearchPeopleInteractorProtocol {

    weak var presenter: SearchPeoplePresenterProtocol?
    
    func searchPeople(query: String) {
        SearchPeopleRepository.searhPeople(query: query).done { [weak self] (PeopleResponse) in
            var returnable = [Person]()
            PeopleResponse.forEach { (response) in
                returnable.append(response.person)
            }
            self?.presenter?.actualize(People: returnable)
        } .catch { (error) in
            print(error)
        }
        
    }
}
