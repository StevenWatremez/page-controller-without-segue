//
//  DataViewController.swift
//  Tutorial
//
//  Created by Steven_WATREMEZ on 13/06/2017.
//  Copyright © 2017 Niji. All rights reserved.
//

import UIKit

struct DataModel {
  let title: String
}

extension DataModel: Equatable {
  static func ==(lhs: DataModel, rhs: DataModel) -> Bool {
    return lhs.title == rhs.title
  }
}

class DataViewController: UIViewController {

  @IBOutlet weak var dataLabel: UILabel!
  var dataObject: DataModel?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.dataLabel.text = dataObject?.title
  }


}

