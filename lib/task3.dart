import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
class BiometricAuthPage extends StatefulWidget {
  const BiometricAuthPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BiometricAuthPageState createState() => _BiometricAuthPageState();
}
class _BiometricAuthPageState extends State<BiometricAuthPage> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  String _authorized = 'Not Authorized';
  List<BiometricType> _availableBiometrics = [];
  Future<void> _authenticate({required String biometricType}) async {
    bool authenticated = false;
    try {
      authenticated = await _localAuth.authenticate(
        localizedReason: 'Scan your $biometricType to authenticate',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    });
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await _localAuth.canCheckBiometrics;
      if (!canCheckBiometrics) {
        setState(() {
          _authorized = 'No biometrics available';
        });
        return;
      }
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _authorized = 'Error checking biometrics';
      });
      return;
    }
    try {
      _availableBiometrics = await _localAuth.getAvailableBiometrics();
      print('Available biometrics: $_availableBiometrics');
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _authorized = 'Error getting available biometrics';
      });
      return;
    }
    if (!_availableBiometrics.contains(BiometricType.face)) {
      setState(() {
        _authorized = 'Face authentication not available';
      });
    } else {
            await _authenticate(biometricType: 'face');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/12.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.security,
                  size: 110,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => _authenticate(biometricType: 'fingerprint'),
                  icon: const Icon(Icons.fingerprint),
                  label: const Text('Authenticate by Fingerprint'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _checkBiometrics,
                  icon: const Icon(Icons.face),
                  label: const Text('Authenticate by Face Detection'),
                ),
                const SizedBox(height: 20),
                Text('Status: $_authorized'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
