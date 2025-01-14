import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Service class for interacting with the HERE Reverse Geocoding API
class HereApiService {
  static const String _baseUrl = 'https://revgeocode.search.hereapi.com/v1';
  static String get _apiKey {
    final key = dotenv.env['HERE_API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('HERE_API_KEY not found in environment variables');
    }
    return key;
  }

  /// Retrieves the location name for given coordinates
  ///
  /// [lat] - Latitude of the location
  /// [lng] - Longitude of the location
  /// Returns a formatted address string or error message
  static Future<String> getLocationName(double lat, double lng) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/revgeocode?at=$lat,$lng&lang=en-US&apiKey=$_apiKey&maxResults=1',
        ),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          final items = data['items'] as List;

          if (items.isNotEmpty) {
            final address = items[0]['address'];
            return _formatAddress(address as Map<String, dynamic>);
          }
          return 'No results found for this location';

        case 401:
          return 'Authentication failed - Invalid API key';
        case 403:
          return 'Authorization failed';
        case 429:
          return 'Rate limit exceeded';
        default:
          return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error fetching location: ${e.toString()}';
    }
  }

  /// Formats the address components into a readable string
  ///
  /// [address] - Map containing address components from the API response
  static String _formatAddress(Map<String, dynamic> address) {
    final List<String> addressParts = [];

    // Add address components in order of specificity
    final components = [
      'street',
      'houseNumber',
      'district',
      'city',
      'postalCode',
      'state',
      'countryName'
    ];

    for (final component in components) {
      if (address[component] != null &&
          address[component].toString().isNotEmpty) {
        // Combine street and house number
        if (component == 'houseNumber' && addressParts.isNotEmpty) {
          addressParts[0] = '${addressParts[0]} ${address[component]}';
        } else {
          addressParts.add(address[component].toString());
        }
      }
    }

    return addressParts.join(', ');
  }
}
