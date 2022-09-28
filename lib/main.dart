import 'package:flutter/material.dart';
import 'package:safe_device/safe_device.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device Safe Check',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Device Safe Check'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isJailBroken = false;
  bool canMockLocation = false;
  bool isRealDevice = true;
  bool isOnExternalStorage = false;
  bool isSafeDevice = false;
  bool isDevelopmentModeEnable = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await Permission.locationWhenInUse.serviceStatus.isEnabled;
    if (!mounted) return;
    try {
      isJailBroken = await SafeDevice.isJailBroken;
      canMockLocation = await SafeDevice.canMockLocation;
      isRealDevice = await SafeDevice.isRealDevice;
      isOnExternalStorage = await SafeDevice.isOnExternalStorage;
      isSafeDevice = await SafeDevice.isSafeDevice;
      isDevelopmentModeEnable = await SafeDevice.isDevelopmentModeEnable;
    } catch (error) {
      print(error);
    }

    setState(() {
      isJailBroken = isJailBroken;
      canMockLocation = canMockLocation;
      isRealDevice = isRealDevice;
      isOnExternalStorage = isOnExternalStorage;
      isSafeDevice = isSafeDevice;
      isDevelopmentModeEnable = isDevelopmentModeEnable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('isJailBroken():'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      isJailBroken ? "Yes" : "No",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('canMockLocation():'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      canMockLocation ? "Yes" : "No",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('isRealDevice():'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      isRealDevice ? "Yes" : "No",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('isOnExternalStorage():'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      isOnExternalStorage ? "Yes" : "No",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('isSafeDevice():'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      isSafeDevice ? "Yes" : "No",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('isDevelopmentModeEnable():'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      isDevelopmentModeEnable ? "Yes" : "No",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
