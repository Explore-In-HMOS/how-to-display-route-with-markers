import { map, mapCommon, MapComponent } from '@kit.MapKit';
import { NavigationService } from '../services/NavigationService';


@Entry
@Component
export struct HomePage {
  private mapController?: map.MapComponentController;

  @State mapOptions: mapCommon.MapOptions = {
    position: { target: { latitude: 38.447967, longitude: 27.179380 }, zoom: 13 }
  };

  @State originLatLng? : String = ''
  @State destinationLatLng? : String = ''

  @State currentLocation: mapCommon.MarkerOptions = {
    position: { latitude: 38.447967, longitude: 27.179380},
    title: 'Mistral Izmir',
    clickable: true,
    anchorU: 0.5,
    anchorV: 1,
    alpha: 1
  };

  @State destinationLocation: mapCommon.MarkerOptions = {
    position: { latitude: 38.44851900956436, longitude: 27.208443791225854},
    title: 'Forum Bornova',
    clickable: true,
    anchorU: 0.5,
    anchorV: 1,
    alpha: 1
  };


  async aboutToAppear() {
  }

  build() {
    Column() {
      Button('Create Route')
        .width('100%')
        .onClick( async () => {

          const routeResult = await NavigationService
            .getDrivingRouteTo(this.currentLocation.position,this.destinationLocation.position)

          if (routeResult && routeResult.routes?.length > 0) {
            const route = routeResult.routes[0];
            if (route.overviewPolyline) {
              const polyline: mapCommon.MapPolylineOptions = {
                points: route.overviewPolyline,
                width: 10,
                color: 0xFF0A84FF
              };
              await this.mapController?.addPolyline(polyline);
            }
          }
        })


      MapComponent({
        mapOptions: this.mapOptions,

        mapCallback: async (err, ctrl) => {
          if (!err) {
            this.mapController = ctrl;
            await ctrl?.addMarker(this.currentLocation);
            await ctrl?.addMarker(this.destinationLocation)
          }
        }
      })
        .width('100%')
        .height('100%')
    }
  }
}
