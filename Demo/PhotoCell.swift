//
//  PrinceCollectionViewCell.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2019/8/4.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    func updateContentInset() {
        // 利用 cell & iamge 的高度做計算，
        // 因為此時 scrollView & image view 的高度還不是正確的高度
        guard let imageHeight = imageView.image?.size.height else {
            return
        }
        let inset = (bounds.height - imageHeight * scrollView.zoomScale) / 2
        scrollView.contentInset = .init(top: max(inset, 0), left: 0, bottom: 0, right: 0)
    }
    
    func updateZoom() {
        guard let imageSize = imageView.image?.size else { return }
        let widthScale = bounds.size.width / imageSize.width
        let heightScale = bounds.size.height / imageSize.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.maximumZoomScale = max(widthScale, heightScale)
        scrollView.zoomScale = scale
        // scrollViewDidZoom 有可能沒有觸發，
        // 因此在這裡先呼叫一次
        updateContentInset()
        
    }
    
    
}

extension PhotoCell: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateContentInset()
    }
    
}
