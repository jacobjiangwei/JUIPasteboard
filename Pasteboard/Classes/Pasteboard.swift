//
//  Pasteboard.swift
//
//
//  Created by Jacob Jiang on 8/13/20.
//

import Foundation
import MobileCoreServices
import UIKit

struct PasteImageData {
    var width: CGFloat
    var height: CGFloat
    var type: String
    var data: Data
}

class Pasteboard {
    var plainText: String?
    var images: [UIImage] = [] // store image data as UIImage into UIPasteboard
    var imageData: [PasteImageData] = [] // read pasteboard images as data, easy to upload
    var pdfData: [Data] = []

    func readPasteboard() {
        readText()
        readItems()
        convertAllImageToPngData()
    }

    func convertAllImageToPngData() {
        autoreleasepool {
            for image in images {
                if let pngData = image.pngData() {
                    let pasteData: PasteImageData = PasteImageData(width: image.size.width, height: image.size.height, type: "image/png", data: pngData)
                    imageData.append(pasteData)
                }
            }
            self.images = []
        }
    }

    func saveToPasteboard() {
        UIPasteboard.general.items = []
        UIPasteboard.general.string = ""
        UIPasteboard.general.images = []

        if images.count != 0 {
            UIPasteboard.general.images = images
        }

        if imageData.count != 0 {
            for imageData in imageData {
                if imageData.type.contains("gif") {
                    UIPasteboard.general.setData(imageData.data, forPasteboardType: "com.compuserve.gif")
                } else {
                    if let img = UIImage(data: imageData.data) {
                        UIPasteboard.general.images?.append(img)
                    }
                }
            }
        }

        if pdfData.count != 0 {
            var items: [[String: Any]] = []
            for data in pdfData {
                items.append([kUTTypePDF as String: data])
            }
            UIPasteboard.general.addItems(items)
        }

        if plainText != nil {
            UIPasteboard.general.addItems([[kUTTypePlainText as String: plainText!]])
        }
    }

    private func readText() {
        if UIPasteboard.general.string != nil && UIPasteboard.general.string != "" {
            plainText = UIPasteboard.general.string
        }
    }

    private func readImage() {
        if UIPasteboard.general.images != nil {
            images = UIPasteboard.general.images!
        } else if UIPasteboard.general.image != nil {
            images.append(UIPasteboard.general.image!)
        }
    }

    private func readItems() {
        let items = UIPasteboard.general.items
        for item in items {
            /* read web archieve*/
            var archiveData = item[kUTTypeWebArchive as String] as? Data
            if archiveData == nil {
                archiveData = item["Apple Web Archive pasteboard type"] as? Data
            }
            if archiveData != nil {
                if let webArchive = try? PropertyListSerialization.propertyList(from: archiveData!, options: PropertyListSerialization.ReadOptions.mutableContainers, format: nil) as? NSDictionary {
                    let subItems = webArchive["WebSubresources"] as? NSArray

                    // filter out images in web clips
                    let predicate = NSPredicate(format: "WebResourceMIMEType like 'image*'")
                    if let imageDicArray = subItems?.filtered(using: predicate) as? [NSDictionary] {
                        for imageDic in imageDicArray {
                            if let data = imageDic["WebResourceData"] as? Data, let fileType = imageDic["WebResourceMIMEType"] as? String {
                                let image = UIImage(data: data)
                                let pasteImageData = PasteImageData(width: image!.size.width, height: image!.size.height, type: fileType, data: data)
                                imageData.append(pasteImageData)
                            }
                        }
                    }
                    // fliter out pdf in web clips
                    let pdfPredicate = NSPredicate(format: "WebResourceMIMEType like 'application/pdf'")
                    if let pdfDicArray = subItems?.filtered(using: pdfPredicate) as? [NSDictionary] {
                        for pdfDic in pdfDicArray {
                            if let data = pdfDic["WebResourceData"] as? Data {
                                pdfData.append(data)
                            }
                        }
                    }
                }
            }
            /* read all images*/
            var imageTypes = [kUTTypeJPEG, kUTTypeTIFF, kUTTypePICT, kUTTypePNG, kUTTypeQuickTimeImage, kUTTypeAppleICNS, kUTTypeBMP, kUTTypeICO, kUTTypeRawImage, kUTTypeScalableVectorGraphics]
            if #available(iOS 9.1, *) {
                imageTypes.append(kUTTypeLivePhoto)
            }
            for type in imageTypes {
                if let newImage = item[type as String] as? UIImage {
                    images.append(newImage)
                }
            }

            if let gifData = UIPasteboard.general.data(forPasteboardType: "com.compuserve.gif") {
                if let gifImage = UIPasteboard.general.value(forPasteboardType: "com.compuserve.gif") as? UIImage {
                    let pasteboardData = PasteImageData(width: gifImage.size.width, height: gifImage.size.height, type: "image/gif", data: gifData)
                    imageData.append(pasteboardData)
                }
            }
            /* read pdf docs*/

            if let newPdfData = item[kUTTypePDF as String] as? Data {
                pdfData.append(newPdfData)
            }
        }
    }
}
