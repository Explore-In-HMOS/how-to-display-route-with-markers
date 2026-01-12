import {navi, mapCommon } from '@kit.MapKit';

export class NavigationService {
  static async getDrivingRouteTo(currentLocation: mapCommon.LatLng, destination: mapCommon.LatLng):
    Promise<navi.RouteResult | null> {
    try {

      const params: navi.DrivingRouteParams = {
        origins: [currentLocation],
        destination: destination,
        language: 'en'
      };

      const result = await navi.getDrivingRoutes(params);
      console.info('Driving route received.');
      return result;
    } catch (error) {
      console.error('Error fetching route:', error);
      return null;
    }
  }
}
