import Foundation

class ShowDetailPresenter: ShowDetailPresenterProtocol {

    public init(show: Show) {
        self.show = show
    }
    weak var view: ShowDetailViewProtocol?
    var show: Show!
    var interactor: ShowDetailInteractorProtocol?
    var router: ShowDetailRouterProtocol?
    var episodes: [[Episode]] = []
    var numberOfSection: Int {
        episodes.count
    }
    var showSumary: String? {
        return show.summary
    }
    var cellIdentifier: String {
        return "EpisodeCell"
    }

    func numberOfRowIn(Section section: Int) -> Int {
        return episodes[section].count
    }

    func objectForCellAt(IndexPath indexPath: IndexPath) -> Any {
        return EpisodeCellConfiguration(from: episodes[indexPath.section][indexPath.row])
    }

    func getEpisodes() {
        guard let id = show.id else { return }
        interactor?.getEpisodesFrom(ShowId: id)
    }

    func actualize(Episodes episodes: [[Episode]]) {
        self.episodes = episodes
        view?.reloadData()
    }

}
