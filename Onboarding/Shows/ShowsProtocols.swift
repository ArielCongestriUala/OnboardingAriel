import Foundation

protocol ShowsRouterProtocol: class {
    func navigateToDetail(show: Show)
}

protocol ShowsPresenterProtocol: class {
    var shows: [Show] { get }
    var numberOfItems: Int  { get }
    func selectedItemAt(IndexPath indexPath: IndexPath)
    func getShows()
    func actualize(Shows shows: [Show])
    func objectForCellAt(IndexPath indexPath: IndexPath) -> Any
    func searchBarTextDidChange(To text: String)
    func userDidTapSearch(Text text: String?)
    func willDisplayCellAt(IndexPath indexPath: IndexPath)
}


protocol ShowsInteractorProtocol: class {
    var presenter: ShowsPresenterProtocol?  { get set }
    func getShows(page: Int)
    func searchShow(query: String)
}


protocol ShowsViewProtocol: class {
    var presenter: ShowsPresenterProtocol?  { get set }
    func reloadData()
}
