import UIKit

class ShowDetailView: UIViewController, ShowDetailViewProtocol {

    //MARK:- ViewProtocol implementacion
	var presenter: ShowDetailPresenterProtocol?
    func reloadData() {
        tableView.reloadData()
    }
    //MARK:- vars and Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sumary: UILabel!
    //MARK:- ViewController LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getEpisodes()
        tableView.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: "EpisodeCell")
        sumary.text = presenter?.showSumary
    }
}

extension ShowDetailView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSection ?? 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowIn(Section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter?.cellIdentifier ?? "", for: indexPath)
        (cell as? EpisodeCell)?.configure(with: presenter?.objectForCellAt(IndexPath: indexPath))
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
}
