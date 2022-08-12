import UIKit
import AARatingBar


class ViewController: UIViewController{
    
    

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var customRatingBar: UIView!
    @IBOutlet weak var infoDataCV: UICollectionView!
    @IBOutlet weak var menuCV: UICollectionView!
    @IBOutlet weak var pageView: UIView!
    
    var ratingbar: AARatingBar?
    var pageTitle = ["LOANED ITEMS", "AVAILABLEITEMS"]
    var infoTile = ["All:","Pending:","Loaned:","Available:"]
    var infoData = [String]()
    var selectedItem = 0
    var pageMenu: CAPSPageMenu!
    var nextViewDelegate:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        infoDataCV.delegate = self
        infoDataCV.dataSource = self
        infoDataCV.register(UINib(nibName: "ItemInfosCell", bundle: nil), forCellWithReuseIdentifier: "ItemInfosCell")
        menuCV.delegate = self
        menuCV.dataSource = self
        menuCV.register(UINib(nibName: "MenuNameCell", bundle: nil), forCellWithReuseIdentifier: "MenuNameCell")
        setUpPageMenu()
        
    }
//    func childViewControllerDidPressButton(childViewController: Int) {
//        print(childViewController)
//        selectedItem = childViewController
//        menuCV.reloadData()
//        pageMenu.moveToPage(childViewController)
//    }
    func setUpPageMenu() {
        self.infoData.append("\(0)")
        self.infoData.append("\(2)")
        self.infoData.append("\(3)")
        self.infoData.append("\(10)")
        menuCV.delegate = self
        menuCV.dataSource = self
        menuCV.register(UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        
        
        var controllerArray: [UIViewController] = []
        

        let VC1 = STORYBOARDHOME.instantiateViewController(withIdentifier: "LoanedViewController") as! LoanedViewController
        VC1.moveDelegate = self
        VC1.parentNavigation = self.navigationController

        controllerArray.append(VC1)
        
        let VC2 = STORYBOARDHOME.instantiateViewController(withIdentifier: "AvailableViewController") as! AvailableViewController
        
        controllerArray.append(VC2)
        let parameters: [CAPSPageMenuOption] = [
            .hideTopMenuBar(true)]
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: 0, width: pageView.frame.size.width, height:  pageView.frame.size.height), pageMenuOptions: parameters)
        pageMenu.delegate = self
        pageMenu!.view.backgroundColor = UIColor.clear
        pageView.addSubview(pageMenu!.view)
    }

}
extension ViewController : CAPSPageMenuDelegate {
   
    func didMoveToPage(_ controller: UIViewController, index: Int) {
        selectedItem = index
        menuCV.reloadData()
    }
}
extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == infoDataCV{
            return infoTile.count
        }else {
            return pageTitle.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        if collectionView == infoDataCV{
            let cell = infoDataCV.dequeueReusableCell(withReuseIdentifier: "ItemInfosCell", for: indexPath) as! ItemInfosCell
            if indexPath.row != 0{
                cell.countDataLabel.text = "\(infoData[indexPath.row])"
            }
            

            
            return cell
        }else {
            let cell = menuCV.dequeueReusableCell(withReuseIdentifier: "MenuNameCell", for: indexPath) as! MenuNameCell
            
            cell.menuNameLabel.text = pageTitle[indexPath.row]
            cell.menuNameLabel.textColor = (selectedItem == indexPath.row) ? #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)  : UIColor.lightGray
            cell.menuNameLabel.font = (selectedItem == indexPath.row) ?  cell.menuNameLabel.font.withSize(15) : cell.menuNameLabel.font.withSize(13)
            cell.lineView.backgroundColor = (selectedItem == indexPath.row) ? #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)  : UIColor.lightGray
            cell.lineView.borderColor = (selectedItem == indexPath.row)  ? #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)  : UIColor.lightGray
            
            return cell
        }
       return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if collectionView == infoDataCV{
            return CGSize(width: self.view.frame.width, height: 50)
        }else {
            return CGSize(width: self.view.frame.width / 2, height: 50)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = indexPath.row
        menuCV.reloadData()
        pageMenu.moveToPage(indexPath.row)
    }
}


extension ViewController: moveNextDelegate{
    func didSelectIndex(index: Int) {
        selectedItem = index
        menuCV.reloadData()
        pageMenu.moveToPage(index)
    }
    
//    button
//    for controller in self.navigationController!.viewControllers as Array {
//        if controller.isKind(of: ViewController.self) {
//            self.navigationController!.popToViewController(controller, animated: true)
//            break
//        }
//    }
}
