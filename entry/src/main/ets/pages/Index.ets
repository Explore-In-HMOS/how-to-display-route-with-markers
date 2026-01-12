import { HomePage } from './HomePage';

@Entry
@Component
struct Index {
  build() {
    RelativeContainer() {
      HomePage()
    }
    .height('100%')
    .width('100%')
  }
}