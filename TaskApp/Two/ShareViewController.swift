//
//  ShareViewController.swift
//  TaskApp
//
//  Created by CV on 12/3/21.
//

import UIKit
import  Photos
enum ActivityTypeNew {
    case sites
    case leads
}


class ShareViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    var documentInteractionController: UIDocumentInteractionController = UIDocumentInteractionController()

    
    @IBOutlet weak var shareBtn: UIButton!
   
    @IBOutlet weak var dateLabel: UILabel!
    
    var activityNewType: ActivityTypeNew?
    var tag = 0
    var code:String?
    var rootName = ""
    var rootAddress = ""
    var leadStatus:String?
    var pageListArray = [String] ()
    var refresher:UIRefreshControl!
    var pageTitle = ["Task", "File"]
    var selectedItem = 0
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarFrame = UIApplication.shared.statusBarFrame
        let statusBarView = UIView(frame: statusBarFrame)
        self.view.addSubview(statusBarView)
        statusBarView.backgroundColor = .green
        print(tag)
        print(code)
        print(rootName)
        print(rootAddress)
        print(leadStatus)
        print(pageListArray)
        print(activityNewType)
        // Do any additional setup after loading the view.
    }
    func postImageToInstagram(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @IBAction func shareClicked(_ sender: AnyObject) {
       
//        postImageToInstagram(image: UIImage(named: "Product") ?? UIImage())

//        showSimpleActionSheet()
        
//                        let text = "This is the text...."
//        let image = UIImage(named: "Product")
//        let myWebsite = NSURL(string:"https://stackoverflow.com/users/4600136/mr-javed-multani?tab=profile")
//        let shareAll = [text , image ?? UIImage(), myWebsite as Any] as [Any]
//                            let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
//                            activityViewController.popoverPresentationController?.sourceView = self.view
//                            self.present(activityViewController, animated: true, completion: nil)
       let shareLink = "https://stackoverflow.com/users/4600136/mr-javed-multani?tab=profile"
        let activityViewController = UIActivityViewController(activityItems: ["Shared as : \(shareLink)"], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.postToFacebook]
        activityViewController.completionWithItemsHandler = { activity, success, items, error in
            debugPrint("activity?.rawValue=\(String(describing: activity?.rawValue))")
        }
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        self.present(activityViewController, animated: true, completion: nil)
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
            if error != nil {
                print(error)
            }

            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

            let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)

            if let lastAsset = fetchResult.firstObject as? PHAsset {

                let url = URL(string: "instagram://library?LocalIdentifier=\(lastAsset.localIdentifier)")!

                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Instagram is not installed", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }

            }
    }
    func showSimpleActionSheet() {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Filter one", style: .destructive, handler: { (_) in
                print("Filter one button")
            }))

            alert.addAction(UIAlertAction(title: "Filter two", style: .destructive, handler: { (_) in
                print("Filter two button")
            }))

            alert.addAction(UIAlertAction(title: "Filter three", style: .destructive, handler: { (_) in
                print("Filter three button")
            }))

            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
                print("User click Dismiss button")
            }))

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        }
    @IBAction func whatsappShareWithoutImage(_ sender: AnyObject)
    {
        let originalString = "First Whatsapp Share"
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)

        let url  = URL(string: "whatsapp://send?text=\(escapedString!)")

        //Text which will be shared on WhatsApp is: "First Whatsapp Share"
        
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    @IBAction func whatsappShareLink(_ sender: AnyObject)
    {
//        let originalString = "https://www.google.co.in"
//        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
//        let url  = URL(string: "whatsapp://send?text=\(escapedString!)")
//
//        if UIApplication.shared.canOpenURL(url! as URL) {
//            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
//        }
        
        showInstaSheet()
    }
    func shareToStoriesInstagram(image:UIImage){
        guard let instagramUrl = URL(string : "instagram-stories://share") else { return }
        if UIApplication.shared.canOpenURL(instagramUrl){
            let paste = [["com.instagram.sharedSticker.backgroundImage":image as Any]]
            UIPasteboard.general.setItems(paste)
            UIApplication.shared.open(instagramUrl)
            
        }
        
    }
    func shareToPostInstagram(image:UIImage){
        guard let instagramUrl = URL(string : "instagram://app") else { return }
        if UIApplication.shared.canOpenURL(instagramUrl){
            let paste = [["com.instagram.photo":image as Any]]
            UIPasteboard.general.setItems(paste)
            UIApplication.shared.open(instagramUrl)
            
        }
        
    }
    func shareToInstagramFeed(image: UIImage) {
        // build the custom URL scheme
        guard let instagramUrl = URL(string: "instagram://app") else {
            return
        }

        // check that Instagram can be opened
        if UIApplication.shared.canOpenURL(instagramUrl) {
            // build the image data from the UIImage
            guard let imageData = image.jpegData(compressionQuality: 100) else {
                return
            }

            // build the file URL
            let path = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.ig")
            let fileUrl = URL(fileURLWithPath: path)

            // write the image data to the file URL
            do {
                try imageData.write(to: fileUrl, options: .atomic)
            } catch {
                // could not write image data
                return
            }

            // instantiate a new document interaction controller
            // you need to instantiate one document interaction controller per file
            let documentController = UIDocumentInteractionController(url: fileUrl)
            documentController.delegate = self
            // the UTI is given by Instagram
            documentController.uti = "com.instagram.photo"

            // open the document interaction view to share to Instagram feed
            documentController.presentOpenInMenu(from: self.view.frame, in: self.view, animated: true)
        } else {
            // Instagram app is not installed or can't be opened, pop up an alert
        }
    }
    func showInstaSheet() {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Filter one", style: .destructive, handler: { (_) in
                print("Filter one button")
                self.shareToStoriesInstagram(image: UIImage(named: "blank-profile-picture") ?? UIImage())
            }))

        alert.addAction(UIAlertAction(title: "Filter two", style: .destructive, handler: { [self] (_) in
                print("Filter two button")
                self.shareToPostInstagram(image: UIImage(named: "blank-profile-picture") ?? UIImage())
            }))
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
                print("User click Dismiss button")
            }))

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        }
    
    
    @IBAction func whatsappShareWithImages(_ sender: AnyObject)
    {
      
//        let urlWhats = "whatsapp://app"
//        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed) {
//            if let whatsappURL = URL(string: "whatsapp://send?text=\(urlWhats)") {
//
//                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
//
//                    if let image = UIImage(named: "blank-profile-picture") {
//                        if let imageData = image.jpegData(compressionQuality: 1.0) {
//                            let tempFile = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/whatsApp.wai")
//                            do {
//                                try imageData.write(to: tempFile, options: .atomic)
//                                self.documentInteractionController = UIDocumentInteractionController(url: tempFile)
//                                self.documentInteractionController.uti = "net.whatsapp.image"
//                                self.documentInteractionController.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
//
//                            } catch {
//                                print(error)
//                            }
//                        }
//                    }
//
//                } else {
//                    // Cannot open whatsapp
//                }
//            }
//        }
 
        let someText:String = "Hello want to share text also"
           let objectsToShare:URL = URL(string: "http://www.google.com")!
           let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
           let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
           activityViewController.popoverPresentationController?.sourceView = self.view

        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]

           self.present(activityViewController, animated: true, completion: nil)
        
        
    }
}








// MARK: old code
//                let text = "This is the text...."
//                    let myWebsite = NSURL(string:"https://stackoverflow.com/users/4600136/mr-javed-multani?tab=profile")
//                    let shareAll = [text  , myWebsite] as [Any]
//                    let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
//                    activityViewController.popoverPresentationController?.sourceView = self.view
//                    self.present(activityViewController, animated: true, completion: nil)
// MARK: share
//    let text = "This is the text...."
//        let image = UIImage(named: "Product")
//        let myWebsite = NSURL(string:"https://stackoverflow.com/users/4600136/mr-javed-multani?tab=profile")
//        let shareAll = [text , image! , myWebsite] as [Any]
//        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self.view
//        self.present(activityViewController, animated: true, completion: nil)

//    defualt mail
//    let appURL = URL(string: "mailto:test@example.com")!
//
//    if #available(iOS 10.0, *) {
//        UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
//    } else {
//        UIApplication.shared.openURL(appURL)
//    }



//        let recipientEmail = "test@email.com"
//                   let subject = "Multi client email support"
//                   let body = "This code supports sending email via multiple different email apps on iOS! :)"
//
//                if let emailUrl = createEmailUrl(to: recipientEmail, subject: subject, body: body) {
//                       UIApplication.shared.open(emailUrl)
//                   }


//        guard let whatsAppUrl = NSURL(string: "whatsapp://send?text="+urlQuizStringEncoded!) else { return }
//
//              if UIApplication.shared.canOpenURL(whatsAppUrl as URL) {
//
//                  if #available(iOS 10.0, *) {
//                      print(urlQuizStringEncoded!)
//                      UIApplication.shared.open(whatsAppUrl as URL, options: [:], completionHandler: nil)
//                  } else {
//
//                      UIApplication.shared.openURL(whatsAppUrl as URL)
//
//                  }
//              }
//              else{
//
//
//              }


//    private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
//                let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//                let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//
//                let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
//                let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
//                let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
//                let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
//                let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
//
//                if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
//                    return gmailUrl
//                } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
//                    return outlookUrl
//                } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
//                    return yahooMail
//                } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
//                    return sparkUrl
//                }
//
//                return defaultUrl
//            }

//func shareWhatsappLink(){
//    let message = "First Whatsapp Share & https://www.google.co.in"
//    var queryCharSet = NSCharacterSet.urlQueryAllowed
//
//    // if your text message contains special characters like **+ and &** then add this line
//    queryCharSet.remove(charactersIn: "+&")
//
//    if let escapedString = message.addingPercentEncoding(withAllowedCharacters: queryCharSet) {
//        if let whatsappURL = URL(string: "whatsapp://send?text=\(escapedString)") {
//            if UIApplication.shared.canOpenURL(whatsappURL) {
//                UIApplication.shared.open(whatsappURL, options: [: ], completionHandler: nil)
//            } else {
//                debugPrint("please install WhatsApp")
//            }
//        }
//    }
//}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



