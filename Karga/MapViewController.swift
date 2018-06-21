import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var Map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var location = CLLocationCoordinate2DMake(40.9735707, 29.240541200000052)
        
        var span  = MKCoordinateSpanMake(0.002, 0.002)
        var region = MKCoordinateRegion(center: location, span: span)
        Map.setRegion(region, animated: true)
        
        var annotation  = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Karga"
        annotation.subtitle = "Turgay Yücel"
        
        Map.addAnnotation(annotation)
    }

}
