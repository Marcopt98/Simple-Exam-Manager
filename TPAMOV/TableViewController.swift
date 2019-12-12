//
//  TableViewController.swift
//  TPAMOV
//
//  Created by Marco André Marinho Lopes on 07/12/2018.
//  Copyright © 2018 Marco. All rights reserved.
//

import UIKit

protocol RefreshTableView {
    func refresh()
}

class TableViewController: UITableViewController, RefreshTableView {

    let app = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    @IBAction func onOrderAction(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Escolha a ordem que deseja na lista:",preferredStyle: .alert)
        let ordemAlf = UIAlertAction(title:"Por Ordem Alfabética", style: .default){
            (action) in self.app.lstUnidadesCurriculares.sort(by: {$0.nome < $1.nome})
                        self.tableView.reloadData()
                        print("Lista de Unidades Curriculares:")
                        for uc in self.app.lstUnidadesCurriculares{
                            print(" - \(uc.getName())")
                        }
        }
        let ordemAno = UIAlertAction(title:"Por Ano", style: .default){
            (action) in self.app.lstUnidadesCurriculares.sort(by: {$0.ano < $1.ano})
                        self.tableView.reloadData()
                        print("Lista de Unidades Curriculares:")
                        for uc in self.app.lstUnidadesCurriculares{
                            print(" - \(uc.getName())")
                        }
        }
        let ordemSemestre = UIAlertAction(title:"Por Semestre", style: .default){
            (action) in self.app.lstUnidadesCurriculares.sort(by: {$0.semestre < $1.semestre})
                        self.tableView.reloadData()
        }
        let ordemEp_normal = UIAlertAction(title:"Por Data Ep.Normal", style: .default){
            (action) in self.app.lstUnidadesCurriculares.sort(by: {$0.e_normal < $1.e_normal})
                        self.tableView.reloadData()
        }
        
        let ordemEp_recurso = UIAlertAction(title:"Por Data Ep.Recurso", style: .default){
            (action) in self.app.lstUnidadesCurriculares.sort(by: {$0.e_recurso < $1.e_recurso})
                        self.tableView.reloadData()
        }
        
        let ordemEp_especial = UIAlertAction(title:"Por Data Ep.Especial", style: .default){
            (action) in self.app.lstUnidadesCurriculares.sort(by: {$0.e_especial < $1.e_especial})
                        self.tableView.reloadData()
        }
        
        alert.addAction(ordemAlf)
        alert.addAction(ordemAno)
        alert.addAction(ordemSemestre)
        alert.addAction(ordemEp_normal)
        alert.addAction(ordemEp_recurso)
        alert.addAction(ordemEp_especial)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return app.lstUnidadesCurriculares.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemUnidadeCurricular", for: indexPath)

        // Configure the cell...
        let row = indexPath.row
        
        cell.textLabel?.text = app.lstUnidadesCurriculares[row].getName()
        cell.detailTextLabel?.text = app.lstUnidadesCurriculares[row].getDates()
        return cell
    }
    
    //override func viewDidAppear(_ animated: Bool) {
    //    tableView.reloadData()
    //}
    @IBAction func onCancel(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    func refresh() {
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            app.lstUnidadesCurriculares.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let row_orig = fromIndexPath.row
        let row_dest = to.row
        
        let uc = app.lstUnidadesCurriculares.remove(at: row_orig)
        app.lstUnidadesCurriculares.insert(uc, at: row_dest)
    }
    
    var selected = 0
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
        
        performSegue(withIdentifier: "editUC", sender: tableView)
    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "editUC"){
            let vc = segue.destination as! AdicionarUCViewController
            vc.delegate = self
            if sender is UITableView {
                vc.selectedUC = app.lstUnidadesCurriculares[selected]
            }
        }
    }
    

}
