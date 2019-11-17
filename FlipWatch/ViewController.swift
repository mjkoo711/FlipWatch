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
