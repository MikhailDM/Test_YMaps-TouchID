//
//  MainViewController.swift
//  WAI
//
//  Created by Михаил Дмитриев on 21.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var checkAndGoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NanigationBar hide
        navigationController?.navigationBar.isHidden = true
    }
    
    
 //MARK: - ACTIONS
    @IBAction func checkAndGoButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "mapSegue", sender: .none)
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
