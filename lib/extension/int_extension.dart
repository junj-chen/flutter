import '../shared/size_fit.dart';

// 扩展 double 的方法
extension DoubleFit on int {
  double get px {
    return HYSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return HYSizeFit.setRpx(this.toDouble());
  }
}
