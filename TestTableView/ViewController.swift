//
//  ViewController.swift
//  TestTableView
//
//  Created by Nagraju on 27/01/20.
//  Copyright © 2020 iOSDevelopers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView?

    var names = ["ABC","DEF","Indonesia","Iran","Iraq","Ireland","Israel","Italy","America"]
    
    var repeatCount = 0
    var selectedNames = [String]()
    var nonSelectedNames = [String]()
    var selectedIndexPaths = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedOnRefresh(_ sender : UIBarButtonItem) {
        getNonSelectedNames()
        print(nonSelectedNames)
        nonSelectedNames = nonSelectedNames.shuffled()
        names.removeAll()
        names = selectedNames + nonSelectedNames
        tableView?.reloadData()
        }

}



extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
                    cell.textLabel?.text = names[indexPath.row]

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appendSelectedNames(selectedName: names[indexPath.row])
        
        
    }
    
    func appendSelectedNames (selectedName : String){
        
        if(selectedNames.contains(selectedName)){
            
        }
        else{
            selectedNames.append(selectedName)
        }
        
//        for value in selectedNames {
//            if(selectedName == value){
//                repeatCount += 1
//            }
//        }
//
//        if(repeatCount == 0){
//            selectedNames.append(selectedName)
//            repeatCount = 0
//        }
    }
    
    func getNonSelectedNames (){
        nonSelectedNames.removeAll()
        for value in names{
            
                if(selectedNames.contains(value)){
                    
                }
                else{
                    nonSelectedNames.append(value)
            }
            }
        }
    }
    

