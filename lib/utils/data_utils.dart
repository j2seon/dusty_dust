//공통적으로 사용할 함수를 저장하는 곳!!!
import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/model/status_model.dart';

class DataUtils{

  //현재시간
  static String getTimeFromDateTime({required DateTime dateTime}){
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${getTimeFormat(dateTime.hour)}:${getTimeFormat(dateTime.minute)}';
  }
  //시간 00:00 모양으로 포멧하기
  static String getTimeFormat(int number){
    return number.toString().padLeft(2,'0');
  }

  //단위 추가
  static String getUnitFromItemCode({required ItemCode itemCode}){
    switch(itemCode){
      case ItemCode.PM10:
        return '㎍/m';

      case ItemCode.PM25:
        return '㎍/m';

      default:
        return 'ppm';
    }
  }

  //아이템코드 영어를 한글로바꿔주기
  static String itemCodeString({required ItemCode itemCode}){
    switch(itemCode){
      case ItemCode.PM10:
        return '미세먼지';
      case ItemCode.PM25:
        return '초미세먼지';
      case ItemCode.NO2:
        return '이산화질소';
      case ItemCode.CO:
        return '일산화탄소';
      case ItemCode.SO2:
        return '아황산가스';
      case ItemCode.O3:
        return '오존';
    }
  }
  static StatusModel getStatusFromItemCodeAndValue({
    required double value,
    required ItemCode itemCode,
  }){
    return statusLevel.where((status) {
      if(itemCode == ItemCode.PM10){
        return status.minFineDust < value;
      }else if(itemCode == ItemCode.PM25){
        return status.minUltraFineDust < value;
      }else if(itemCode == ItemCode.CO){
        return status.minCO < value;
      }else if(itemCode == ItemCode.O3){
        return status.minO3 < value;
      }else if(itemCode == ItemCode.NO2){
        return status.minNO2 < value;
      }else if(itemCode == ItemCode.SO2){
        return status.minSO2 < value;
      }else{
        throw Exception('알수없는 ItemCode입니다.');
      }
    }).last;
  }
}