//
//  PedidoVentaCell.swift
//  MiInventario
//
//  Created by Daniel Llamas on 7/26/16.
//  Copyright © 2016 Llamas. All rights reserved.
//

import UIKit

class VentaCell: UITableViewCell {
    
    @IBOutlet weak var cantidadLbl: CantidadLabel?
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = fondoGris
        self.titleLbl.textColor = textoGrisFuerte
        self.titleLbl.font = UIFont(name: "Avenir Medium", size: 18.0)
        self.subLbl.textColor = textoGrisClaro
        self.subLbl.font = UIFont(name: "Avenir Medium", size: 13.0)
        
    }
    
}
