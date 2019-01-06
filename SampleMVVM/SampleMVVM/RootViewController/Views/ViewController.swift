//
//  ViewController.swift
//  SampleMVVM
//
//  Created by Balraj on 05/01/19.
//  Copyright © 2019 IBM. All rights reserved.
//

import UIKit

class ViewController: UIViewController,RegisterCell, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var firstViewTableivew: UITableView!
    
    var viewModel: ViewControllerConfigurrables! {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ViewControllerViewModel()
        self.navigationItem.title = "First View"
        firstViewTableivew.delegate = self
        firstViewTableivew.dataSource = self
        registerTableCell()
      //  LoadingIndicatorView.show("Please Wait")
        viewModel!.callAPI(completion: { result in
            if true {
            } else {
                print(false)
            }
        })
    }
    
    private func registerTableCell(){
        self.firstViewTableivew?.register(UINib(nibName: FirstTableViewCell.reuseID(), bundle: nil), forCellReuseIdentifier: FirstTableViewCell.reuseID())
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return viewModel.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.reuseID(), for: indexPath) as? FirstTableViewCell else {
            return UITableViewCell()
        }
        cell.cellViewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let storyBoard = UIStoryboard(name:"DetailsView" , bundle: nil)
            let VC: DetailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    
    func registerCell() {
        print("RegistreCell here")
    }
    
    func displayActivityController(){
        LoadingIndicatorView.show("Please wait")
    }
    
    func removeIndicato() {
        LoadingIndicatorView.hide()
    }
    
    func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            self?.firstViewTableivew.reloadData()
        }
    }
    
    func showAPIAlert(){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Warning", message: "An error has occurred, please contact USC.", preferredStyle: UIAlertController.Style.alert)
            let confirmAction = UIAlertAction(title: "Accept" , style: UIAlertAction.Style.default, handler: { (action) -> Void in
            })
            alert.addAction(confirmAction)
            self.present(alert, animated: false, completion: nil)
        }
    }
}

