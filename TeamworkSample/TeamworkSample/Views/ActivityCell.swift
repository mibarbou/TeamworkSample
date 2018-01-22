//
//  ActivityCell.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 21/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import UIKit
import Kingfisher

class ActivityCell: UITableViewCell {
    static let identifier = "ActivityCell"

    @IBOutlet weak var todoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var forUserImageView: UIImageView!
    @IBOutlet weak var forUserNameLabel: UILabel!
    @IBOutlet weak var fromUserImageView: UIImageView!
    @IBOutlet weak var fromUserNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(activity: Activity) {
        let viewModel = ActivityViewDataMapper.map(input: activity)
        todoNameLabel.text = viewModel.todoListName
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.dateTime
        forUserImageView.kf.setImage(with: activity.forUserAvatarUrl)
        forUserNameLabel.text = viewModel.forUsername
        fromUserImageView.kf.setImage(with: activity.fromUserAvatarUrl)
        fromUserNameLabel.text = viewModel.forUsername
    }
    
}
