//
//  ViewController.swift
//  StackOverflowQuestionsDisplay
//
//  Created by Madhu on 01/04/18.
//  Copyright © 2018 Madhu. All rights reserved.
//

//MARK: Header Files

import UIKit
import ObjectMapper 

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var questionsTblView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Properties
    
    var questionsItemResponse : Array<Items> = []
    var pageNo = 1
    let pageSize = 12
    
    //MARK: ViewLifeCycle
    
    //DidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionsTblView.register(UINib.init(nibName: "QuestionsDisplayTableViewCell", bundle: nil), forCellReuseIdentifier: "QuestionsDisplayTableViewCell")
        self.questionsTblView.tableFooterView = UIView()
        self.questionsTblView.estimatedRowHeight = 44.0
        self.questionsTblView.rowHeight = UITableViewAutomaticDimension
    }
    
    //WillAppear()
    
    override func viewWillAppear(_ animated: Bool) {
        self.activityIndicator.startAnimating()
        self.questionsItemResponse.removeAll()
        self.questionsLoadingApiServiceCall(pageNo: self.pageNo, size: self.pageSize)
    }
    
    //MARK: Helper Methods
    
    func questionsLoadingApiServiceCall(pageNo: Int, size: Int) {
        var indexPathArray = [IndexPath]()
        Services.getQuestions(pageNo: pageNo, pageSize: size) { (response) in
            print("page no===>", pageNo)
            let getQuestionsArray = Mapper<GetQuestions>().map(JSONObject: response.result.value)
            if let questionItems = getQuestionsArray?.items {
                for elements in questionItems {
                    self.questionsItemResponse.append(elements)
                    let indexpath = IndexPath(row: self.questionsItemResponse.count - 1, section : 0)
                    indexPathArray.append(indexpath)
                }
                self.questionsTblView.beginUpdates()
                self.questionsTblView.insertRows(at: indexPathArray, with: .fade)
                self.questionsTblView.endUpdates()
                
                self.questionsTblView.tableFooterView = UIView()
            }
            if self.questionsItemResponse.count > 0 {
                DispatchQueue.main.async{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsItemResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = questionsTblView.dequeueReusableCell(withIdentifier: "QuestionsDisplayTableViewCell", for: indexPath) as! QuestionsDisplayTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        cell.questionsDisplayLbl.text = self.questionsItemResponse[indexPath.row].topic
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        if indexPath.row ==  self.questionsItemResponse.count - 1 {
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .white)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: UIScreen.main.bounds.width, height: CGFloat(44))
            self.questionsTblView.tableFooterView = spinner
            self.pageNo = pageNo + 1
            questionsLoadingApiServiceCall(pageNo: self.pageNo, size: self.pageSize)
        }
    }
}

