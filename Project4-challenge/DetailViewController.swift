//
//  DetailViewController.swift
//  Project4-challenge
//
//  Created by Luciene Ventura on 13/04/21.
//

import UIKit
import WebKit


class DetailViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
//these are the websites available on the table view
//didSet observer was used to show the right website according to the table view
    
    var websiteSelected: String?
    var websites = ["https://apple.com", "https://hackingwithswift.com", "https://google.com"] {
        didSet {
            for website in websites {
                websiteSelected = website
            }
        }
    }
    
//loads a webview
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        
    }

//loads everything we see on the webview
    override func viewDidLoad() {
        super.viewDidLoad()
            let url = URL(string: websiteSelected!)!
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let goBack = UIBarButtonItem(title: "<", style: .plain, target: webView, action: #selector(webView.goBack))
        let goForward = UIBarButtonItem(title: ">", style: .plain, target: webView, action: #selector(webView.goForward))
    
        toolbarItems = [goBack, goForward, spacer, refresh]
        navigationController?.isToolbarHidden = false
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }

}
