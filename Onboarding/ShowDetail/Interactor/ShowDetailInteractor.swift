import UIKit

class ShowDetailInteractor: ShowDetailInteractorProtocol {

    weak var presenter: ShowDetailPresenterProtocol?

    func getEpisodesFrom(ShowId id: Int) {
        ShowDetailRepository.getEpisodes(id: id) { [weak self] (episodes) in
            var returnable = [[Episode]]()

            var sesonArray = [Episode]()
            var sesonIndex = 1
            episodes.forEach { (episode) in
                if sesonIndex == episode.season {
                    sesonArray.append(episode)
                } else {
                    returnable.append(sesonArray)
                    sesonArray = []
                    sesonIndex += 1
                    sesonArray.append(episode)
                }
            }
            returnable.append(sesonArray)
            self?.presenter?.actualize(Episodes: returnable)
        }
    }
}
