import UIKit

class ShowsRouter: ShowsRouterProtocol {
    
    weak var viewController: UIViewController?

    func navigateToDetail(show: Show) {
        guard let navigation = viewController?.navigationController else { return }
        navigation.pushViewController(ShowDetailModule.build(show: show), animated: true)
    }
}
