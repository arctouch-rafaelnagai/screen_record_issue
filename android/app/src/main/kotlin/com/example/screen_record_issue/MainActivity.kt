package com.example.screen_record_issue

import android.content.Intent
import android.transition.Scene
import com.ed_screen_recorder.EdScreenRecorderPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "ed_screen_recorder")
//                .setMethodCallHandler { call, result ->  }
        EdScreenRecorderPlugin.registerWith(flutterEngine.dartExecutor.binaryMessenger, this)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        EdScreenRecorderPlugin.instance.onActivityResult(requestCode, resultCode, data)
        super.onActivityResult(requestCode, resultCode, data)
    }
}

