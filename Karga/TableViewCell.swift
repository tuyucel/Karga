import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cargoID: UILabel!
    @IBOutlet weak var cargoInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
