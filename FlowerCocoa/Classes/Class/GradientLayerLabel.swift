import UIKit

public class GradientLayerLabel: UILabel {
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradLayer: CAGradientLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func config(mode: Flower_CA_GradientLayerPointMode, colors: [CGColor]?, locations: [NSNumber]?) {
        if let gradLayer = layer as? CAGradientLayer {
            gradLayer.colors = colors
            gradLayer.locations = locations
            gradLayer.startPoint = mode.point.0
            gradLayer.endPoint = mode.point.1
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
