package com.weenbalaqee.weenbalaqee

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val engine = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"user")
        engine.setMethodCallHandler{call, reslut->
            if (call.method == "login"){
                reslut.success("ppu ${call.arguments}")
            }else{
                reslut.notImplemented()
            }
        }
    }
}
