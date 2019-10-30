import Foundation

class ShowsPresenter: ShowsPresenterProtocol {

    weak var view: ShowsViewProtocol?
    var interactor: ShowsInteractorProtocol? {
        didSet {
            getShows()
        }
    }
    var router: ShowsRouterProtocol?
    var shows: [Show] = []
    var numberOfItems: Int {
        return shows.count
    }
    private var page = 0
    
    func selectedItemAt(IndexPath indexPath: IndexPath) {
        router?.navigateToDetail()
    }

    func getShows() {
        page += 1
        interactor?.getShows(page: page)
    }

    func actualize(Shows shows: [Show]) {
        self.shows = shows
        view?.reloadData()
    }

    func objectForCellAt(IndexPath indexPath: IndexPath) -> Any {
        return ShowCellConfiguration(from: shows[indexPath.row])
    }
}
