import Foundation
import PromiseKit

class ShowsInteractor: ShowsInteractorProtocol {

    weak var presenter: ShowsPresenterProtocol?

    func getShows(page: Int) {
        ShowsRepository.getSwhows(page: page).done { [weak self] (show) in
            self?.presenter?.actualize(Shows: show)
        }
    }

    func searchShow(query: String) {
        ShowsRepository.searchShow(query: query) { [weak self] (shows) in
            self?.presenter?.actualize(Shows: shows)
        }
    }

}
