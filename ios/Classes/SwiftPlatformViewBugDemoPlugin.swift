import Flutter
import UIKit

public class SwiftPlatformViewBugDemoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "fooView", binaryMessenger: registrar.messenger())
    let instance = SwiftPlatformViewBugDemoPlugin()
    registrar.register(FooPlatformViewFactory(with: registrar), withId: "fooView");
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}

class FooPlatformViewFactory: NSObject, FlutterPlatformViewFactory {
  private var registrar: FlutterPluginRegistrar;
  
  init(with registrar: FlutterPluginRegistrar) {
    self.registrar = registrar;
  }

  public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height));
    myView.backgroundColor = UIColor.red;
    return FooPlatformView(viewIdentifier: viewId, fooView: myView)
  }
}

class FooPlatformView: NSObject, FlutterPlatformView {
  private let fooView: UIView
  private(set) var viewId: Int64

  init(viewIdentifier viewId: Int64,  fooView: UIView) {
    self.fooView = fooView;
    self.viewId = viewId;
    super.init();
  }

  func view() -> UIView {
    return fooView;
  }
}