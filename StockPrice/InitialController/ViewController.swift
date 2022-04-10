//
//  ViewController.swift
//  StockPrice
//
//  Created by Zhehui Yang on 4/10/22.
//

import UIKit

class ViewController: UIViewController, SendStockDelegate{
    
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblLow: UILabel!
    @IBOutlet weak var lblHigh: UILabel!
    let stockArr = ["FB","AAPL","GOOG","MSFT","AMZN"]
    var stockModels: [StockQuote] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getStockData("AAPL").done{ stock in
            self.lblCompanyName.text = stock.companyName
            self.lblSymbol.text = "\(stock.symbol)"
            self.lblPrice.text = "\(stock.price)"
            self.lblHigh.text = "\(stock.dayHigh)"
            self.lblLow.text = "\(stock.dayLow)"
            
        }
        
        getAllStockValues(stockArr).done { stocks in
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
            self.stockModels = stocks
            
        }
        
        print(getAllStockValues(stockArr))
    }
//    func loadStockData(){
//        getAllStockValues(stockArr)
//            .done{ quotes in
//                self.stockModels = []
//                for i in 0 ... quotes.count - 1{
//                    //print("\(quotes[i].symbol) : \( quotes[i].price)")
//                    self.stockData.append(quotes[i])
//                }
//                self.tblView.reloadData()
//            }.catch{error in
//                print(error.localizedDescription)
//            }
//    }
    
    func sendStockData(_ stockModel: StockQuote) {
        lblCompanyName.text = stockModel.companyName
        lblSymbol.text = stockModel.symbol
        lblPrice.text = "\(stockModel.price)"
        lblHigh.text = "\(stockModel.dayHigh)"
        lblLow.text = "\(stockModel.dayLow)"
        print(stockModel.companyName)
    }

}

