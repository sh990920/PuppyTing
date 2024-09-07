//
//  ChattingTableViewCell.swift
//  PuppyTing
//
//  Created by 내꺼다 on 8/29/24.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {

    static let identifier = "ChattingViewCell"
    
   let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 17
        imageView.layer.borderColor = UIColor.puppyPurple.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    let messageBox: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.backgroundColor = UIColor.systemGray3
        textView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.layer.cornerRadius = 10
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.sizeToFit()
        return textView
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "(임시이름)"
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        [profileImage, messageBox, name, date].forEach {
            contentView.addSubview($0)
        }
        
        profileImage.snp.makeConstraints {
            $0.centerY.equalTo(messageBox.snp.top)
            $0.leading.equalToSuperview().inset(15)
            $0.width.height.equalTo(34)
        }
        
        messageBox.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(10)
            $0.top.equalTo(name.snp.bottom).offset(5)
            $0.bottom.equalToSuperview()
            $0.height.greaterThanOrEqualTo(30)
            $0.width.lessThanOrEqualTo(255)
        }
        
        name.snp.makeConstraints {
            $0.leading.equalTo(messageBox.snp.leading)
            $0.top.equalToSuperview()
        }
        
        date.snp.makeConstraints {
            $0.leading.equalTo(messageBox.snp.trailing).offset(5)
            $0.bottom.equalTo(messageBox.snp.bottom)
        }
        
    }

}