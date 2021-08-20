//
//  ViewController.swift
//  BottomSheetDialog
//
//  Created by wanderingfairy on 08/21/2021.
//  Copyright (c) 2021 wanderingfairy. All rights reserved.
//

import UIKit
import BottomSheetDialog

class ViewController: UIViewController, BottomDialogDelegate {
  
  func didTapSheet(title: String, tag: Int) {
    switch tag {
    default:
      print(tag)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let sheet = BottomDialogView(titles: ["delete", "cancel"],
                                 images: [UIImage(named: "trash")!.withRenderingMode(.alwaysOriginal),
                                          UIImage(named: "xmark")!.withRenderingMode(.alwaysOriginal)])
    sheet.delegate = self
    sheet.titleFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    sheet.sheetHeight = 56
    sheet.imageSize = CGSize(width: 30, height: 30)
    sheet.removeFromSuperviewWhenDidTap = true
    sheet.sheetCornerRadius = 14
    sheet.sheetBottomPadding = view.safeAreaInsets.bottom
    view.addSubview(sheet)
    sheet.show()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

