import UIKit

class SearchPeopleView: UIViewController, SearchPeopleViewProtocol {
    //MARK: - Protocol implementation
	var presenter: SearchPeoplePresenterProtocol?
    func reloadData() {
        tableView.reloadData()
    }
    //MARK:- vars and outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    //MARK:- ViewController Life Cicle
	override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
    }
}
extension SearchPeopleView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        (cell as? PersonCell)?.configure(with: presenter?.objectForCellAt(IndexPath: indexPath))
        return cell
    }

}

extension SearchPeopleView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchBarTextDidChange(To: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.userDidTapSearch(Text: searchBar.text)
    }
}
