import 'package:flutter/material.dart';
import 'package:favorite_places/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 38.7177167,
      longitude: -9.1652914,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Pick Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(
                  _pickedLocation ??
                      LatLng(
                        widget.location.latitude,
                        widget.location.longitude,
                      ),
                );
              },
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onTap: widget.isSelecting
                ? (position) {
                    print(
                      'Map tapped at: ${position.latitude}, ${position.longitude}',
                    );
                    setState(() {
                      _pickedLocation = position;
                    });
                  }
                : null,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.location.latitude,
                widget.location.longitude,
              ),
              zoom: 16,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('m1'),
                position:
                    _pickedLocation ??
                    LatLng(widget.location.latitude, widget.location.longitude),
              ),
            },
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            mapToolbarEnabled: false,
          ),
          // Debug overlay to test touch events
          if (widget.isSelecting)
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _pickedLocation == null
                      ? 'Tap on map to select location'
                      : 'Location: ${_pickedLocation!.latitude.toStringAsFixed(4)}, ${_pickedLocation!.longitude.toStringAsFixed(4)}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
