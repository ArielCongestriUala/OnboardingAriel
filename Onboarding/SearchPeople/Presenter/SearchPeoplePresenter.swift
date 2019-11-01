import UIKit

class SearchPeoplePresenter: SearchPeoplePresenterProtocol {

    weak var view: SearchPeopleViewProtocol?
    var interactor: SearchPeopleInteractorProtocol?
    var router: SearchPeopleRouterProtocol?
    var people: [Person] = []
    var numberOfItems: Int {
        return people.count
    }
    
    func selectedItemAt(IndexPath indexPath: IndexPath) {
        router?.navigateToDetail(people: people[indexPath.row])
    }
    
    func actualize(People people: [Person]) {
        self.people = people
        view?.reloadData()
    }
    
    func objectForCellAt(IndexPath indexPath: IndexPath) -> Any {
        return PersonCellConfiguration(person: people[indexPath.row])
    }
    
    func searchBarTextDidChange(To text: String) {
        interactor?.searchPeople(query: text)
    }
    
    func userDidTapSearch(Text text: String?) {
        guard let text = text else { return }
        interactor?.searchPeople(query: text)
    }
}
