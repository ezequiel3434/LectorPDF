//
//  ViewController.swift
//  LectorPDF
//
//  Created by Ezequiel Parada Beltran on 03/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    
    
    var contenidoCelda = ["pdf1", "pdf2", "pdf3"]
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        if segue.identifier! == "pantallaDosSegue" {
             let idPdfRecibido = sender as! Int
            
            let objPantalla2: ViewController2 = segue.destination as! ViewController2
            print(contenidoCelda[idPdfRecibido])
            
            objPantalla2.nombrePdfRecibido = contenidoCelda[idPdfRecibido]
        }
    }
    
  

    

}

extension ViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoCelda.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        celda.textLabel?.text = contenidoCelda[indexPath.row]
        celda.imageView!.image = UIImage(named: "Libro.jpg")
          return celda
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let idPdfSelected = indexPath.row
        
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: idPdfSelected)
        
        
        
       
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contenidoCelda.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
}








