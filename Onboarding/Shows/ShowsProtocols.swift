import Foundation

protocol ShowsRouterProtocol: class {
    func navigateToDetail()
}

protocol ShowsPresenterProtocol: class {
    var shows: [Show] { get }
    var numberOfItems: Int  { get }
    func selectedItemAt(IndexPath indexPath: IndexPath)
    func getShows()
    func actualize(Shows shows: [Show])
    func objectForCellAt(IndexPath indexPath: IndexPath) -> Any
}


protocol ShowsInteractorProtocol: class {
    var presenter: ShowsPresenterProtocol?  { get set }
    func getShows(page: Int)
}


protocol ShowsViewProtocol: class {
    var presenter: ShowsPresenterProtocol?  { get set }
    func reloadData()
}
