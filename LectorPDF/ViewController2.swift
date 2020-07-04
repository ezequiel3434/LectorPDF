//
//  ViewController2.swift
//  LectorPDF
//
//  Created by Ezequiel Parada Beltran on 04/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit
import WebKit

class ViewController2: UIViewController {

    
    @IBOutlet var vistaWeb: WKWebView!
    
    
    var nombrePdfRecibido: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        habilitarZoom()
        mostrarPDF()
    }
    
    func habilitarZoom(){
        vistaWeb.scalesLargeContentImage = true
    }
    
    
    
    func mostrarPDF(){
        
        // 1- URL del archivo PDF
        
        let direccionPDF = URL(fileURLWithPath: Bundle.main.path(forResource: nombrePdfRecibido!, ofType: "pdf", inDirectory: "PDF")!)
        
        // 2- Transformar  archivo PDF a Data
        
        let datosPDF = try? Data(contentsOf: direccionPDF)
        // 3- Mostrar datos en la vista Web
        
        vistaWeb.load(datosPDF!, mimeType: "application/pdf", characterEncodingName: "utf-8", baseURL: direccionPDF)
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
