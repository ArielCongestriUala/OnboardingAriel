import UIKit

class ShowsModule {

    static func build() -> UIViewController {        
        let view = ShowsView()
        let interactor = ShowsInteractor()
        let router = ShowsRouter()
        let presenter = ShowsPresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
