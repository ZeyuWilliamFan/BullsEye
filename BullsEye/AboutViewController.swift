//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Zeyu Fan on 15/6/23.
//  Copyright (c) 2015年 Zeyu Fan. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html")
        {
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
        }
    }
    
    @IBAction func close()
    {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
