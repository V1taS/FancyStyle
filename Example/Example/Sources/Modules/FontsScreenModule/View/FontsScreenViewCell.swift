//
//  FontsScreenViewCell.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit
import FancyStyle

/// ViewCell для экрана
final class FontsScreenViewCell: UITableViewCell {
  
  // MARK: - Private properties
  
  private let titleLabel = UILabel()
  static let cellIdentifier = FontsScreenViewCell.description()
  
  // MARK: - Initialization
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureLayout()
    applyDefaultBehavior()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Internal func
  
  func configure(fontToken: FontToken) {
    titleLabel.text = fontToken.rawValue
    
    switch fontToken {
    case .primaryBold70:
      titleLabel.font = fancyFont.primaryBold70
    case .primaryBold50:
      titleLabel.font = fancyFont.primaryBold50
    case .primaryBold32:
      titleLabel.font = fancyFont.primaryBold32
    case .primaryBold24:
      titleLabel.font = fancyFont.primaryBold24
    case .primaryBold18:
      titleLabel.font = fancyFont.primaryBold18
    case .primaryBold16:
      titleLabel.font = fancyFont.primaryBold16
    case .primaryBold14:
      titleLabel.font = fancyFont.primaryBold14
    case .primaryBold12:
      titleLabel.font = fancyFont.primaryBold12
    case .primaryBold10:
      titleLabel.font = fancyFont.primaryBold10
    case .primaryMedium80:
      titleLabel.font = fancyFont.primaryMedium80
    case .primaryMedium48:
      titleLabel.font = fancyFont.primaryMedium48
    case .primaryMedium40:
      titleLabel.font = fancyFont.primaryMedium40
    case .primaryMedium32:
      titleLabel.font = fancyFont.primaryMedium32
    case .primaryMedium24:
      titleLabel.font = fancyFont.primaryMedium24
    case .primaryMedium18:
      titleLabel.font = fancyFont.primaryMedium18
    case .primaryMedium16:
      titleLabel.font = fancyFont.primaryMedium16
    case .primaryMedium14:
      titleLabel.font = fancyFont.primaryMedium14
    case .primaryMedium12:
      titleLabel.font = fancyFont.primaryMedium12
    case .primaryMedium10:
      titleLabel.font = fancyFont.primaryMedium10
    case .primaryRegular32:
      titleLabel.font = fancyFont.primaryRegular32
    case .primaryRegular24:
      titleLabel.font = fancyFont.primaryRegular24
    case .primaryRegular18:
      titleLabel.font = fancyFont.primaryRegular18
    case .primaryRegular16:
      titleLabel.font = fancyFont.primaryRegular16
    case .primaryRegular14:
      titleLabel.font = fancyFont.primaryRegular14
    case .primaryRegular12:
      titleLabel.font = fancyFont.primaryRegular12
    case .primaryRegular10:
      titleLabel.font = fancyFont.primaryRegular10
    case .primaryLight48:
      titleLabel.font = fancyFont.primaryLight48
    }
  }
  
  // MARK: - Private func
  
  private func configureLayout() {
    let appearance = Appearance()
    
    [titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    contentView.removeConstraints(contentView.constraints)
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: appearance.titleInsets.left),
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: appearance.titleInsets.top),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -appearance.titleInsets.right),
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -appearance.titleInsets.bottom)
    ])
  }
  
  private func applyDefaultBehavior() {
    backgroundColor = fancyColor.darkAndLightTheme.primaryWhite
    contentView.backgroundColor = fancyColor.darkAndLightTheme.primaryWhite
    selectionStyle = .none
    
    titleLabel.textAlignment = .center
    titleLabel.lineBreakMode = .byTruncatingMiddle
  }
}

// MARK: - Appearance

private extension FontsScreenViewCell {
  struct Appearance {
    let titleInsets = UIEdgeInsets(top: 16,
                                   left: 16,
                                   bottom: .zero,
                                   right: 16)
  }
}
