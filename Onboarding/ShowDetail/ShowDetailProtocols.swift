import Foundation

protocol ShowDetailRouterProtocol: class {

}

protocol ShowDetailPresenterProtocol: class {
    var episodes: [[Episode]] { get }
    var numberOfSection: Int { get }
    var showSumary: String? { get }
    var cellIdentifier: String { get }
    func numberOfRowIn(Section section: Int) -> Int
    func objectForCellAt(IndexPath indexPath: IndexPath) -> Any
    func getEpisodes()
    func actualize(Episodes episodes: [[Episode]])
}

protocol ShowDetailInteractorProtocol: class {
    func getEpisodesFrom(ShowId id: Int)
    var presenter: ShowDetailPresenterProtocol?  { get set }
}


protocol ShowDetailViewProtocol: class {
    var presenter: ShowDetailPresenterProtocol?  { get set }
    func reloadData()
}
