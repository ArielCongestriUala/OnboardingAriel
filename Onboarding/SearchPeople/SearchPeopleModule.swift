import UIKit

class SearchPeopleModule {

    static func build() -> UIViewController {        
        let view = SearchPeopleView()
        let interactor = SearchPeopleInteractor()
        let router = SearchPeopleRouter()
        let presenter = SearchPeoplePresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
