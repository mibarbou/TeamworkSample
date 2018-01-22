//
//  ProjectCell.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import UIKit
import Kingfisher

class ProjectCell: UITableViewCell {
    static let identifier = "ProjectCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(project: Project) {
        let viewModel = ProjectViewDataMapper.map(input: project)
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        logoImageView.kf.setImage(with: project.logo, placeholder: UIImage(named: "projectIcon"))
        creationDateLabel.text = "created on: " + (viewModel.createdOn == "" ? "--": viewModel.createdOn)
        startDateLabel.text = "start date: " + (viewModel.startDate == "" ? "--": viewModel.startDate)
        endDateLabel.text = "end date: " + (viewModel.endDate == "" ? "--": viewModel.endDate)
    }
    
}
