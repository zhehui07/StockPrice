//
//  StockTableViewCode.swift
//  StockPrice
//
//  Created by Zhehui Yang on 4/10/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
                
        let stock = stockModels[indexPath.row]

        
        cell.lblName.text = stock.companyName
        
        
        cell.lblSymbol.text = stock.symbol
        cell.name = stock.companyName
        cell.symbol = stock.symbol
        
        cell.sendStockDataDelegate = self
        
        return cell
    }
    
    
}
