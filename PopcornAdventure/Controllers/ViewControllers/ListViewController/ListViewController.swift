//
//  ListViewController.swift
//  PopcornAdventure
//
//  Created by Arthur Tristan M. Ramos on 10/30/21.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet var noDataView: UIView!
    
    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var dateLastSeenLabel: UILabel!
    
    let detailCellId = "DetailTableViewCell"
    
    var detailsService = DetailService()
    var details: [Detail] = [Detail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getDateLastSeen()
        setupTableView()
        getDetails()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Service calls
extension ListViewController {
    
    /// Set up details fetched from API to assign it to the details array then reload table view to apply the data in the table view.
    private func getDetails() {
        detailsService.getDetails { data, error in
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.details = data.results ?? []
                
                /// Still need to learn in the future grouping of arrays so just sorted the array instead based on `kind` starting from A to Z.
                self.details = self.details.sorted { $0.kind ?? "" < $1.kind ?? "" }
                
                self.listTableView.reloadData()
            }
        }
    }
    
}


// MARK: - Configure views
extension ListViewController {
    
    /// Get date last seen using the persistence service known as `UserDefaults`. Display it when available. Otherwise, hide it.
    private func getDateLastSeen() {
        let persistenceService = Constants.shared.persistenceService
        if let dateLastSeen = persistenceService.string(forKey: "dateLastSeen") {
            dateLastSeenLabel.isHidden = false
            dateLastSeenLabel.text = "Last seen \(dateLastSeen)"
        } else {
            dateLastSeenLabel.isHidden = true
        }
    }
    
    private func setupTableView() {
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(UINib(nibName: detailCellId, bundle: nil), forCellReuseIdentifier: detailCellId)
        listTableView.backgroundView = noDataView
        listTableView.tableFooterView = UIView()
        listTableView.reloadData()
    }
}

// MARK: - Table View Data Source and Delegate Functions
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    /// Set up number of rows for the list which is the number of details provided by the API.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.details.count
    }
    
    /// Set up the cell to use per item from the results. Use the reusable `displayDetails` function.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: detailCellId, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        let detail = details[indexPath.row]
        cell.displayDetails(of: detail)
        return cell
    }
    
    /// Set up height per item.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.shared.tableViewHeight.toCGFloat()
    }
    
    /// Selecting an item, go to `DetailsViewController` to display more details about the movie, song or audiobook. For reusability, pass the `details`.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = details[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.detail = detail
        let navigationController = UINavigationController(rootViewController: detailVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
