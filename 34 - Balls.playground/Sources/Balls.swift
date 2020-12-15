import UIKit

public class Balls: UIView {
    // список цетов для шариков
    private var colors: [UIColor]
    // шарики
    private var balls: [UIView] = []
    private var ballSize: CGSize = CGSize(width: 40, height: 40)
    // аниматор графических объектов
    private var animator: UIDynamicAnimator?
    // обработчик перемещений объектов
    private var snapBehavior: UISnapBehavior?
    // обработчик столкновений
    private var collisionBehavior: UICollisionBehavior
    
    func ballsView() {
        // перебор переданных цветов (они определяют количество шариков)
        for (index, color) in colors.enumerated() {
            // шарик - экземпляр класса UIView
            let ball = UIView(frame: CGRect.zero)
            // указываем цвет шарика (он соответствует переданному цвету
            ball.backgroundColor = color
            // накладываем отображение шарика на отображение подложки
            addSubview(ball)
            // добавляем экземпляр шарика в массик шариков
            balls.append(ball)
            // вычисляем отступ шарика по осям X и Y, каждый поледующий шарик должен быть правее и ниже предыдущего
            let origin = 40 * index + 100
            // отображение шарика в виде прямоугольника
            ball.frame = CGRect(x: origin, y: origin, width: Int(ballSize.width), height: Int(ballSize.height))
            // с закругленными углами
            ball.layer.cornerRadius = ball.bounds.width / 2.0
            // добавляем шарик в обработчик столкновений
            collisionBehavior.addItem(ball)
        }
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location( in: self)
            for ball in balls {
                if (ball.frame.contains(touchLocation)) {
                    snapBehavior = UISnapBehavior(item: ball, snapTo: touchLocation)
                    snapBehavior?.damping = 0.5
                    animator?.addBehavior(snapBehavior!)
                }
            }
        }
    }
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location( in: self)
            if let snapBehavior = snapBehavior {
                snapBehavior.snapPoint = touchLocation
            }
        }
    }
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let snapBehavior = snapBehavior {
            animator?.removeBehavior(snapBehavior)
        }
        snapBehavior = nil
    }
    
    public init(colors: [UIColor]) {
        self.colors = colors
        // создание значения свойства столкновения
        collisionBehavior = UICollisionBehavior(items:[])
        // указание на то, что границы отображения также являются объектами взаимодействия
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        backgroundColor = UIColor.black
        // подключаем аниматор с указанием на сам класс
        animator = UIDynamicAnimator(referenceView: self)
        // подключаем обработку столкновений в аниматор
        animator?.addBehavior(collisionBehavior)
        // вызов функции отрисовки шариков
        ballsView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
