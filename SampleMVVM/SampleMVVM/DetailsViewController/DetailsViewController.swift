//
//  DetailsViewController.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, DetailsUICallbacks {
    @IBOutlet weak var detailsTableView: UITableView!
    var indexPathOfPreviouslySelectedRow: IndexPath?
    
    
    var viewModel: DetailConfigurables! {
        didSet{
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DetailsControllerViewModel()
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        registerTableCell()
    }
    
    private func registerTableCell(){
        self.detailsTableView?.register(UINib(nibName: DetailsTableViewCell.reuseID(), bundle: nil), forCellReuseIdentifier: DetailsTableViewCell.reuseID())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.reuseID(), for: indexPath) as? DetailsTableViewCell else {
            return UITableViewCell()
        }
       cell.cellViewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
