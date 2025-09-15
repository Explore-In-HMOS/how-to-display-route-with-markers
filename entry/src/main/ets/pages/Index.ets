import { HomePage } from './HomePage';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      HomePage()
    }
    .height('100%')
    .width('100%')
  }
}