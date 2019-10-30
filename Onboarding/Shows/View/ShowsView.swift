import UIKit

class ShowsView: UIViewController, ShowsViewProtocol {
    //MARK:- Presenter implementation
	var presenter: ShowsPresenterProtocol?
    func reloadData() {
        collectionView.reloadData() 
    }
    //MARK:- Vars and Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    //MARK:- Life cicle
	override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ShowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ShowCell")
    }
}
extension ShowsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowCell", for: indexPath)
        (cell as? ShowCollectionViewCell)?.configureWith(presenter?.objectForCellAt(IndexPath: indexPath))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.selectedItemAt(IndexPath: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 70)
    }
    
}
extension ShowsView: UISearchBarDelegate {
    
}
