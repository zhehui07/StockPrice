//
//  ProtocelSendStockData.swift
//  StockPrice
//
//  Created by Zhehui Yang on 4/10/22.
//

import Foundation
protocol SendStockDelegate{
    func sendStockData(_ stockModel : StockQuote)
}
