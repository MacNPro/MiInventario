//
//  Splash.swift
//  MiInventario
//
//  Created by Daniel Llamas on 7/16/16.
//  Copyright © 2016 Llamas. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Material

class Splash: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (FIRAuth.auth()?.currentUser) != nil {
            let uID: String = (FIRAuth.auth()?.currentUser?.uid)!
            let baseRef: FIRDatabaseReference! = FIRDatabase.database().reference().child("usuarios").child(uID)
            
            baseRef.child("premium").observe(.value, with: { (premiumSnapshot) in
                if premiumSnapshot.exists() {
                    let premium = premiumSnapshot.value as! Int
                    if premium == 0 {
                        baseRef.child("expiracion").observeSingleEvent(of: .value, with: { (snapshot) in
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd-MM-yyyy"
                            
                            let hoy = dateFormatter.string(from: Date())
                            let exp:String = snapshot.value as! String
                            
                            let fHoy = hoy.characters.split{$0 == "-"}.map(String.init)
                            let fExp = exp.characters.split{$0 == "-"}.map(String.init)
                            
                            var fechaHoy = [Int]()
                            var fechaExp = [Int]()
                            
                            for i in 0...2 {
                                fechaHoy.append(Int(fHoy[i])!)
                                fechaExp.append(Int(fExp[i])!)
                            }
                            
                            if (fechaExp[1] == 1){
                                if ((((fechaHoy[0] > fechaExp[0]) && (fechaHoy[2] == fechaExp[2]))) || (fechaHoy[1] > fechaExp[1]) || (fechaHoy[2] > fechaExp[2])){
                                    print("Se acabo tu free trail")
                                    self.performSegue(withIdentifier: "aComprarVC", sender: nil)
                                } else {
                                    self.abrirDashboard()
                                }
                            } else {
                                if ((fechaHoy[0] >= fechaExp[0]) && (fechaHoy[1] == fechaExp[1]) || (fechaHoy[1] > fechaExp[1]) || (fechaHoy[2] > fechaExp[2])){
                                    print("Se acabo tu free trail")
                                    self.performSegue(withIdentifier: "aComprarVC", sender: nil)
                                } else {
                                    self.abrirDashboard()
                                }
                            }
                            
                        })
                    } else {
                    
                    }
                } else {
                
                }
            })
            
        } else {
            self.performSegue(withIdentifier: "inicio", sender: nil)
        }
    }
    
    func abrirDashboard(){
        let navigationController: NavigationController = NavigationController(rootViewController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContainerVC") as! ContainerVC)
        let navigationDrawerController: MainNavigationViewController = MainNavigationViewController(rootViewController: navigationController, leftViewController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SidebarTVC") as! SidebarTVC, rightViewController: nil)
        
        UIApplication.shared.keyWindow?.rootViewController = navigationDrawerController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
