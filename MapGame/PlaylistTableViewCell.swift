//
//  PlaylistTableViewCell.swift
//  MapGame
//
//  Created by Os on 3/10/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    @IBOutlet weak var imagePlaylist: UIImageView!

    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
