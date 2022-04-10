//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by Zhehui Yang on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON
func getPriceURL(symbol : String) -> String {
    let url = "\(stockAPIURL)\(symbol)?apikey=\(apiKey)"
    return url
    
}
func getAllStockValues(_ symbols: [String]) -> Promise<[StockQuote]>{// Give a Promise, that is an array of Quote
    
    var Promises : [Promise<StockQuote>] = []
    for i in 0 ... symbols.count - 1{//i start from  0 and less than symbols.count -1
        //sleep(1)
        Promises.append(getStockData(symbols[i]))
    }
    
    return when(fulfilled:Promises)// when everything is fullfilled, I will return the array
}


func getStockData(_ symbol : String) -> Promise<StockQuote>{
    
    
    return Promise<StockQuote>{ seal -> Void in
        let url = getPriceURL(symbol: symbol)
        print(url)
        
        sleep(1)
        AF.request(url).responseJSON{ response in
            if response.error != nil {
                seal.reject(response.error!)
                return
            }
            
            let stocks = JSON(response.data!).arrayValue
            
            let quote = StockQuote()
            print(stocks)
            guard let firstStock = stocks.first else{
                // if it does not exist
                seal.fulfill(quote)
                return
            }
            
            quote.companyName = firstStock["name"].stringValue
            quote.symbol = firstStock["symbol"].stringValue
            quote.price = firstStock["price"].floatValue
            quote.dayHigh = firstStock["dayHigh"].floatValue
            quote.dayLow = firstStock["dayLow"].floatValue
            
            seal.fulfill(quote)
        }// end of request
    }// end of return Promise
}

