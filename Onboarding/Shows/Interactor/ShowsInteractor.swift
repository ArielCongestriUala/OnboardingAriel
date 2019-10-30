import Foundation
import PromiseKit

class ShowsInteractor: ShowsInteractorProtocol {

    weak var presenter: ShowsPresenterProtocol?

    func getShows(page: Int) {
        ShowsRepository.getSwhows(page: page) { [weak self] (shows) in
            self?.presenter?.actualize(Shows: shows)
        }
    }

}
