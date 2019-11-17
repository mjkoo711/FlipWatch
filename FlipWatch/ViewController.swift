//
//  ViewController.swift
//  FlipWatch
//
//  Created by 구민준 on 2019/11/17.
//  Copyright © 2019 mjkoo. All rights reserved.
//

import UIKit
import Splitflap

class ViewController: UIViewController {
  
  @IBOutlet weak var hour: Splitflap!
  @IBOutlet weak var minute: Splitflap!
  @IBOutlet weak var second: Splitflap!
  @IBOutlet weak var adView: UIView!
  
  
  // Set the text to display by animating the flaps

  override func viewDidLoad() {
    super.viewDidLoad()
    hour.datasource = self
    minute.datasource = self
    second.datasource = self
    
    hour.delegate = self
    minute.delegate = self
    second.delegate = self
    
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    hour.setText("11", animated: false)
    minute.setText("22", animated: false)
    second.setText("33", animated: false)
  }
}

extension ViewController: SplitflapDataSource {
  // Defines the number of flaps that will be used to display the text
  func numberOfFlapsInSplitflap(_ splitflap: Splitflap) -> Int {
    return 2
  }
}

extension ViewController: SplitflapDelegate {
  // Configure the appearance for each flaps
  func splitflap(_ splitflap: Splitflap, builderForFlapAtIndex index: Int) -> FlapViewBuilder {
    return FlapViewBuilder { builder in
      builder.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
      builder.cornerRadius    = 8
      builder.font            = .systemFont(ofSize: splitflap.frame.height * 1.4, weight: .medium)
      builder.textAlignment   = .center
      builder.textColor       = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
      builder.lineColor       = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
  }
}
