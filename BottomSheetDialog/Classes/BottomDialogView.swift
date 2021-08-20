import UIKit

public protocol BottomDialogDelegate: AnyObject {
  func didTapSheet(title: String, tag: Int)
}

open class BottomDialogView: UIView {
  
  public weak var delegate: BottomDialogDelegate?
  
  var sheets: [UIView]?
  var titles: [String]
  var images: [UIImage]
  
  open var sheetCornerRadius: CGFloat = 0
  open var sheetCornerRadiusOnlyTop = false
  open var sheetBorderWidth: CGFloat = 0
  open var sheetBorderColor: UIColor = .lightGray
  open var sheetHeight: CGFloat = 56
  open var sheetPadding: CGFloat = 0
  open var imageLeadingPadding: CGFloat = 16
  open var titleLeadingPadding: CGFloat = 20
  open var titleColor: UIColor = .black
  open var titleFont: UIFont = .systemFont(ofSize: 14, weight: .bold)
  open var titleAlignment: NSTextAlignment = .natural
  open var viewBackgroundColor: UIColor? = .black.withAlphaComponent(0.7)
  open var sheetBackgroundColor: UIColor = .white
  open var removeFromSuperviewWhenDidTap = false
  open var sheetBottomPadding: CGFloat = 0
  open lazy var imageSize: CGSize = CGSize(width: 28, height: 28)
  
  public init(titles: [String], images: [UIImage]) {
    guard !titles.isEmpty, titles.count == images.count else {
      fatalError("The count of titles and images must be the same. If you have a title without an image, pass UIImage().")
    }
    self.titles = titles
    self.images = images
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI(titles: [String], images: [UIImage]) {
    self.sheets = generateSheets(titles, images)
    guard let sheets = sheets else { return }
    sheets.enumerated().forEach({ (idx, btn) in
      if idx != sheets.count-1 {
        btn.layer.addBorder([.bottom],
                            color: sheetBorderColor,
                            width: sheetBorderWidth)
      }
      addSubview(btn)
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSheet(sender:)))
      btn.addGestureRecognizer(tapGesture)
    })
    backgroundColor = viewBackgroundColor
  }
  
  private func setupConstraints() {
    guard let sheets = sheets else { return }
    sheets.enumerated().reversed().forEach { (idx, sheet) in
      sheet.tag = idx
      
      if idx == sheets.count-1 {
        NSLayoutConstraint.activate([
          sheet.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sheetPadding),
          sheet.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sheetPadding),
          sheet.heightAnchor.constraint(equalToConstant: sheetHeight),
          sheet.bottomAnchor.constraint(equalTo: bottomAnchor,
                                        constant: -sheetBottomPadding)
        ])
      } else {
        sheets.enumerated().reversed().forEach { (idx, sheet) in
          if idx != sheets.count-1 {
            NSLayoutConstraint.activate([
              sheet.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sheetPadding),
              sheet.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sheetPadding),
              sheet.heightAnchor.constraint(equalToConstant: sheetHeight),
              sheet.bottomAnchor.constraint(equalTo: sheets[idx+1].topAnchor,
                                            constant: -sheetBorderWidth)
            ])
          }
        }
      }
    }
  }
  
  @objc private func didTapSheet(sender: UITapGestureRecognizer) {
    
    delegate?.didTapSheet(title: titles[sender.view?.tag ?? 0], tag: sender.view?.tag ?? 0)
    
    if removeFromSuperviewWhenDidTap {
      removeFromSuperview()
    }
  }
  
  private func generateSheets(_ actions: [String], _ images: [UIImage]) -> [UIView] {
    var generatedSheets: [UIView] = []
    
    zip(actions, images).forEach { (action, image) in
      let sheetView = UIView()
      sheetView.backgroundColor = sheetBackgroundColor
      sheetView.translatesAutoresizingMaskIntoConstraints = false
      
      let actionTitleLabel = UILabel()
      actionTitleLabel.text = action
      actionTitleLabel.font = titleFont
      actionTitleLabel.textColor = titleColor
      actionTitleLabel.textAlignment = .natural
      actionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
      actionTitleLabel.numberOfLines = 1
      actionTitleLabel.lineBreakMode = .byTruncatingTail
      
      let actionImageView = UIImageView()
      actionImageView.image = image
      actionImageView.translatesAutoresizingMaskIntoConstraints = false
      
      sheetView.addSubview(actionImageView)
      sheetView.addSubview(actionTitleLabel)
      
      NSLayoutConstraint.activate([
        actionImageView.leadingAnchor.constraint(equalTo: sheetView.leadingAnchor,
                                                 constant: imageLeadingPadding),
        actionImageView.centerYAnchor.constraint(equalTo: sheetView.centerYAnchor),
        actionImageView.heightAnchor.constraint(equalToConstant: imageSize.height),
        actionImageView.widthAnchor.constraint(equalToConstant: imageSize.width),
        
        actionTitleLabel.leadingAnchor.constraint(equalTo: actionImageView.trailingAnchor,
                                                  constant: titleLeadingPadding),
        actionTitleLabel.centerYAnchor.constraint(equalTo: sheetView.centerYAnchor),
        actionTitleLabel.trailingAnchor.constraint(equalTo: sheetView.trailingAnchor,
                                                   constant: -imageLeadingPadding),
      ])
      
      generatedSheets.append(sheetView)
    }
    
    generatedSheets.first?.clipsToBounds = true
    generatedSheets.first?.layer.cornerRadius = sheetCornerRadius
    generatedSheets.first?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    
    if !sheetCornerRadiusOnlyTop {
      generatedSheets.last?.clipsToBounds = true
      generatedSheets.last?.layer.cornerRadius = sheetCornerRadius
      generatedSheets.last?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    return generatedSheets
  }
}

extension UIWindow {
  static var key: UIWindow! {
    if #available(iOS 13, *) {
      return UIApplication.shared.windows.last!
    } else {
      return UIApplication.shared.keyWindow
    }
  }
}

extension BottomDialogView {
  open func show() {
    setupUI(titles: titles, images: images)
    setupConstraints()
    
    UIWindow.key.addSubview(self)
    NSLayoutConstraint.activate([
      self.topAnchor.constraint(equalTo: superview!.topAnchor),
      self.leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
      self.trailingAnchor.constraint(equalTo: superview!.trailingAnchor),
      self.bottomAnchor.constraint(equalTo: superview!.bottomAnchor)
    ])
  }
}
