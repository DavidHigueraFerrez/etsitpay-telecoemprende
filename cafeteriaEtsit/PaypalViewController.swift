//
//  PaypalViewController.swift
//  cafeteriaEtsit
//
//  Created by Mario on 29/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit
import WebKit

class PaypalViewController: UIViewController, WKUIDelegate, WKNavigationDelegate{
    
    @IBOutlet weak var webView: WKWebView!
    
    var importe = 0.00
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
    self.navigationController?.setNavigationBarHidden(false, animated: true)
        let urlPaypal = "https://www.paypal.me/pruebacafeteria/" + "\(importe)"
        let url = URL(string: urlPaypal)
        let request = URLRequest(url: url!)
        webView.load(request)
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url =  navigationAction.request.url?.absoluteString{
            print(url)
            let amount = self.importe
            if url == "https://www.paypal.com/myaccount/transfer/send/external/ppme?profile=pruebaCafeteria&currencyCode=EUR&amount=" + "\(amount)" + "&locale.x=es_ES&country.x=ES&flowType=send"{
                let ticket =  self.storyboard?.instantiateViewController(withIdentifier: "Ticket") as! TicketViewController
                ticket.pagado = true
               self.navigationController?.pushViewController(ticket, animated: true)
                
            }
        }
        decisionHandler(.allow)
    }

    
}
