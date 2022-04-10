//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Zhehui Yang on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    var symbol = ""
    var name = ""
    var sendStockDataDelegate : SendStockDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func getPriceAction(_ sender: Any) {
        
        getStockData(symbol).done{currentStock in
            currentStock.companyName = self.name
            self.sendStockDataDelegate?.sendStockData(currentStock)
            
        }
        .catch { error in
            print(error.localizedDescription)
        }
            
    }
    
}
