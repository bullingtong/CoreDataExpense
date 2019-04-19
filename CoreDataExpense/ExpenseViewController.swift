//
//  ExpenseViewController.swift
//  CoreDataExpense
//
//  Created by Graeson Bullington on 4/17/19.
//  Copyright © 2019 Graeson Bullington. All rights reserved.
//

import UIKit
import CoreData

class ExpenseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
  let dateFormatter = DateFormatter()
    
    @IBOutlet weak var expenseTableView: UITableView!
    
    var expenses = [Expense]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        
        do{
            expenses = try managedContext.fetch(fetchRequest)
            
            expenseTableView.reloadData()
            
        }catch{
            print("Fetch could not be peerformed")
        }
        
    }
    
    @IBAction func addExpense(_ sender: Any) {
        performSegue(withIdentifier: "showExpense", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expenseTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        let expense = expenses[indexPath.row]
        
        cell.textLabel?.text = expense.name
        
        if let date = expense.date {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showExpense", sender: self)
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
