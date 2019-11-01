import Foundation

protocol SearchPeopleRouterProtocol: class {
    func navigateToDetail(people: Person)
}

protocol SearchPeoplePresenterProtocol: class {
    var people: [Person] { get }
    var numberOfItems: Int  { get }
    func selectedItemAt(IndexPath indexPath: IndexPath)
    func actualize(People people: [Person])
    func objectForCellAt(IndexPath indexPath: IndexPath) -> Any
    func searchBarTextDidChange(To text: String)
    func userDidTapSearch(Text text: String?)
}


protocol SearchPeopleInteractorProtocol: class {
    var presenter: SearchPeoplePresenterProtocol?  { get set }
    func searchPeople(query: String)
}


protocol SearchPeopleViewProtocol: class {
    var presenter: SearchPeoplePresenterProtocol?  { get set }
    func reloadData()
}
