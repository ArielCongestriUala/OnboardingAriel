import Foundation

class ShowsPresenter: ShowsPresenterProtocol {

    weak var view: ShowsViewProtocol?
    var interactor: ShowsInteractorProtocol?
    var router: ShowsRouterProtocol?
    var shows: [Show] = []
    var numberOfItems: Int {
        return shows.count
    }
    private var page = 0
    
    func selectedItemAt(IndexPath indexPath: IndexPath) {
        router?.navigateToDetail(show: shows[indexPath.row])
    }

    func getShows() {
        page += 1
        interactor?.getShows(page: page)
    }

    func actualize(Shows shows: [Show]) {
        if page < 2 {
            self.shows = shows
        } else {
            self.shows.append(contentsOf: shows)
        }
        view?.reloadData()
    }

    func objectForCellAt(IndexPath indexPath: IndexPath) -> Any {
        return ShowCellConfiguration(from: shows[indexPath.row])
    }

    func searchBarTextDidChange(To text: String) {
        if text == "" {
            page = 0
            getShows()
            return
        }
        if text.count % 2 == 0 {
            search(query: text)
        }
    }
    
    func userDidTapSearch(Text text: String?) {
        guard let text = text , text != "" else {
            page = 0
            getShows()
            return
        }
        search(query: text)
    }

    func willDisplayCellAt(IndexPath indexPath: IndexPath) {
        if indexPath.row == shows.count - 1 && page != 0 {
            getShows()
        }
    }

    func userDidTouchUpInsideSearchPeople() {
        router?.navigateToSearchPeople()
    }

    private func search(query: String) {
        page = 0
        interactor?.searchShow(query: query)
    }
}
