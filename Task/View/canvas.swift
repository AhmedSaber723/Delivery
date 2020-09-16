
import UIKit








class Canvas: UIView {
    
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
        
    }
    func screenshot() -> UIImage? {
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image  = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        print(image!)
        return image
       
    }
    
    var lines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        // custom drawing
        super.draw(rect)
       
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
     
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(5)
        context.setLineCap(.round)
        
       
        lines.forEach{ (line) in
            for (i, p) in line.enumerated(){
                if i == 0{
                    context.move(to: p)
                }else{
                    context.addLine(to: p)
                }
            }

        }
        
        context.strokePath()
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
     
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        guard let point =  touches.first?.location(in: self) else{return}
        
        guard var lastline = lines.popLast() else {return}
    
        lastline.append(point)
        lines.append(lastline)

        
        setNeedsDisplay()
    }
    
}
