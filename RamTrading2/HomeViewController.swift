//
//  HomeViewController.swift
//  RamTrading2
//
//  Created by Joshua Fordyce on 3/25/22.
//

import UIKit
import Foundation



class HomeViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    
    
    func getJsonResponse() -> String?{
        
       
            
        let stocksymbols = convertOurCSVIntoArray()
        print(stocksymbols)
        for stocksymbol in stocksymbols {
        
            let IEX_CLOUD_API_TOKEN = "Tpk_059b97af715d417d9f49f50b51b1c448"
            print(IEX_CLOUD_API_TOKEN)
            let api = "https://sandbox.iexapis.com"
            print(api)
            let endpoint = "/stable/stock/\(stocksymbol)/quote?token=\(IEX_CLOUD_API_TOKEN)"
            print(endpoint)
            let apicall = api + endpoint
            print(apicall)
            let stockurl = URL(string: apicall)
            print(stockurl!)
            
            do {
                let stockresponse = try String(contentsOf: stockurl!, encoding: .utf8)
                print(stockresponse)
                
                
            } catch{
                print("Download Error: \(error.localizedDescription)")
                
            }
        }
       return "hope this stuff works"
    }
    
    
        
    
    
    // converts the imported csv file into an Array that we can loop over and enter into a the stock struct
func convertOurCSVIntoArray() -> Array<Any>{
        
        let filepath = Bundle.main.path(forResource: "sp_500_stocks", ofType: "csv")
        
        
        
        var Stonks = ""
        do { Stonks =  try String(contentsOfFile: filepath! )
    } catch {
        print(error)
        let ArrayOfStock:[String] = [Stonks]
        print(ArrayOfStock)
        return ArrayOfStock
        
    }
        print(Stonks)
        var symbolarray: [String] = Stonks.components(separatedBy: "\n")
        print(symbolarray)
        symbolarray.removeFirst()
        print(symbolarray)
        return symbolarray
        }

    
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = convertOurCSVIntoArray()
        print(rows.count)
        return rows.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let symbolsAll = convertOurCSVIntoArray()
        
        // creating a Struct that includes stock name, stock price and other stock information
        struct stock {
            var nameOfStock: [Any] = []
        
        }
        let symbols = stock.init(nameOfStock: symbolsAll)
        
        
        
        print(symbols)
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        print(symbols)
        print(cell)
        
        cell.StockSymbol.text = "this"
          return cell
        }
       
        
        
       


       
        
       
       
      
    

    
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonresponse = getJsonResponse()
        print(jsonresponse as Any)
        let data = Data(jsonresponse!.utf8)
        do {
            // make sure this JSON is in the format we expect
            if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // try to read out a string array
                if let names = jsonResponse["companyName"] as? [String] {
                    print(names)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        
        
        
        homeTableView.rowHeight = 150
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
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
