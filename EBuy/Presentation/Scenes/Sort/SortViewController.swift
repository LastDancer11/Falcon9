//
//  SortViewController.swift
//  EBuy
//
//  Created by user200328 on 7/14/21.
//

import UIKit

class SortViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
       // coordinator?.popVC()
    }

    
    @IBAction func recommendedTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func whatsNewTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func priceHighToLowTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func priceLowToHighTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
