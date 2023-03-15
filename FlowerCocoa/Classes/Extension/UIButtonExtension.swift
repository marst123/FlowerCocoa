import UIKit

public enum ButtonEdgeInsetsStyle {
    
    case imageTopWithTitleBottom    // image在上，label在下
    
    case imageLeftWithTitleRight    // image在左，label在右
    
    case imageBottomWithTitleTop    // image在下，label在上
    
    case imageRightWithTitleLeft    // image在右，label在左
}


// MARK: 边距
public extension UIButton {
    
    /// 控制Button内容布局
    func layoutEdges(style: ButtonEdgeInsetsStyle, space:CGFloat) {
    
        //top、left、bottom、right

        //反的

        //如果同时改变同一条线上的两个属性 等于做了x或y轴的偏移
        
        // edgeInsets初始值
        var imageEdgeInset = UIEdgeInsets.zero
        var labelEdgeInset = UIEdgeInsets.zero
        var contentEdgeInset = UIEdgeInsets.zero
        
        // ButtonImageView Size
        let imageWidth = self.imageView?.intrinsicContentSize.width ?? 0
        let imageHeight = self.imageView?.intrinsicContentSize.height ?? 0
        
        // ButtonLabel Size
        let labelWidth = self.titleLabel?.intrinsicContentSize.width ?? 0
        let labelHeight = self.titleLabel?.intrinsicContentSize.height ?? 0
        
        print(imageWidth)
        print(imageHeight)
        print(labelWidth)
        print(labelHeight)
        
        
        let labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2//label中心x偏移的移动距离
        let imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2//image中心x偏移的移动距离
        
        let labelOffsetY = labelHeight / 2 + space / 2//label中心x偏移的移动距离
        let imageOffsetY = imageHeight / 2 + space / 2//image中心y偏移的移动距离
        
        print("imageOffsetX \(imageOffsetX)")
        print("imageOffsetY \(imageOffsetY)")
        print("labelOffsetX \(labelOffsetX)")
        print("labelOffsetY \(labelOffsetY)")
        
      
        let maxWidth = max(labelWidth, imageWidth)
        let maxHeight = max(labelHeight, imageHeight)
        let changedWidth = labelWidth + imageWidth - maxWidth
        let changedHeight = labelHeight + imageHeight + space - maxHeight
              
        // 赋值
        switch style {
        case .imageTopWithTitleBottom:
            // 首先原型是image左,label右,content的Size也是根据原型来的
            // 我们需要改变label的原始位置,也就是说在同一条线上 如left向左移动 right也要向左移动,才能保证不会压缩原始尺寸
            // label
            
            labelEdgeInset = UIEdgeInsets(top: labelOffsetY, left: -labelOffsetX, bottom: -labelOffsetY, right: labelOffsetX)
            imageEdgeInset = UIEdgeInsets(top: -imageOffsetY, left: imageOffsetX, bottom: imageOffsetY, right: -imageOffsetX)
            contentEdgeInset = UIEdgeInsets(top: imageOffsetY, left: -changedWidth/2, bottom: changedHeight-imageOffsetY, right: -changedWidth/2)
            
        case .imageBottomWithTitleTop:
            labelEdgeInset = UIEdgeInsets(top: -labelOffsetY, left: -labelOffsetX, bottom: labelOffsetY, right: labelOffsetX)
            imageEdgeInset = UIEdgeInsets(top: imageOffsetY, left: imageOffsetX, bottom: -imageOffsetY, right: -imageOffsetX)
            contentEdgeInset = UIEdgeInsets(top: changedHeight-imageOffsetY, left: -changedWidth/2, bottom: imageOffsetY, right: -changedWidth/2)
            
        case .imageLeftWithTitleRight:
            // 由于系统默认样式是image左label右
            // 因此不用调整image
            // 只需要将label位置整体向label的右侧移动space距离
            // 最底层content也因为image没有位置移动,只需要将content层右侧增加label移动的space距离
            
            labelEdgeInset = UIEdgeInsets(top: 0, left: space, bottom: 0, right: -space)
            contentEdgeInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: space)
            
        case .imageRightWithTitleLeft:
            // 由于调换了image与label的位置
            // 因此将label整体向左侧移动一个imageWidth的距离,再将image向右移动一个labelWidth的距离
            // 但同时需要考虑间距改变带来的效果,也就需要增加一个space距离
            // 最底层由于只是改变了image和label的位置,所以只需要增加一个space的距离
            
            labelEdgeInset = UIEdgeInsets(top: 0, left: -imageWidth, bottom: 0, right: imageWidth)
            imageEdgeInset = UIEdgeInsets(top: 0, left: labelWidth+space, bottom: 0, right: -labelWidth-space)
            contentEdgeInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: space)
            
        }
        
        self.titleEdgeInsets = labelEdgeInset
        self.imageEdgeInsets = imageEdgeInset
        self.contentEdgeInsets = contentEdgeInset
        
    }
    
}
