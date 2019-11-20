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
    
    hour.flapSpacing = 6
    minute.flapSpacing = 6
    second.flapSpacing = 6
    
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    hour.setText("11", animated: false)
    minute.setText("22", animated: false)
    second.setText("39", animated: false)
    
    UIView.animate(withDuration: 1) {
      self.second.setText("40", animated: true)
    }
    
    UIView.animate(withDuration: 1) {
      self.second.setText("41", animated: true)
    }
    
    UIView.animate(withDuration: 1) {
      self.second.setText("42", animated: true)
    }
  }
}

extension ViewController: SplitflapDataSource {
  // Defines the number of flaps that will be used to display the text
  func numberOfFlapsInSplitflap(_ splitflap: Splitflap) -> Int {
    return 1
  }
  
  func tokensInSplitflap(_ splitflap: Splitflap) -> [String] {
    return SplitflapTokens.MinuteAndSecond
  }
}

extension ViewController: SplitflapDelegate {
  // Configure the appearance for each flaps
  
  func splitflap(_ splitflap: Splitflap, rotationDurationForFlapAtIndex index: Int) -> Double {
    return 1
  }
  
  func splitflap(_ splitflap: Splitflap, builderForFlapAtIndex index: Int) -> FlapViewBuilder {
    return FlapViewBuilder { builder in
      builder.backgroundColor = UIColor(red: 0.09, green: 0.09, blue: 0.09, alpha: 1)
      builder.cornerRadius    = 8
//      builder.font            = .systemFont(ofSize: splitflap.frame.height * 1.5, weight: .bold)
      builder.font = UIFont(name: "HelveticaNeue-Bold", size: splitflap.frame.height * 1.4)!
      builder.textAlignment   = .center
      builder.textColor       = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
      builder.lineColor       = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
  }
}
