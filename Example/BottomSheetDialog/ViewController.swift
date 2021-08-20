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
    switch title {
    case "delete":
      print("delete")
    default:
      print(title)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
    button.backgroundColor = .blue
    view.addSubview(button)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }
  
  @objc func didTapButton() {
    let sheet = BottomDialogView(titles: ["delete",
                                          "cancel"],
                                 images: [UIImage(named: "trash")!
                                            .withRenderingMode(.alwaysOriginal),
                                          UIImage(named: "xmark")!
                                            .withRenderingMode(.alwaysOriginal)])
    sheet.delegate = self
    sheet.titleFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    sheet.sheetHeight = 56
    sheet.imageSize = CGSize(width: 30, height: 30)
    sheet.removeFromSuperviewWhenDidTap = true
    sheet.sheetCornerRadius = 14
    sheet.sheetBottomPadding = view.safeAreaInsets.bottom
    sheet.sheetBorderWidth = 0.5
    sheet.sheetBorderColor = .gray
    
    view.addSubview(sheet)
    sheet.show()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

