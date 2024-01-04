import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:novandi/core_module/widgets/app_toast.dart';
import 'package:uuid/v4.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};

  _handleTap(LatLng point) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: point.toString(),
        ),
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: point.toString())).then((value) => AppToast.showSuccess('Coordinate Copied!', context: context));

        }
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            initialCameraPosition: const CameraPosition(
              target: LatLng(-6.2265675, 106.8532496),
              zoom: 16,
            ),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1),

            onTap: _handleTap,
          ),
        ],
      ),
    );
  }
}
