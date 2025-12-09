import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_state.dart';
import 'package:movie_app/core/configs/usecase/usecase.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T>(UseCase usecase, {dynamic params}) async {
    var returnedData = await usecase.call(params: params);
    returnedData.fold(
      (error) {
        emit(FailureLoadedData(errorMessage: error));
      },
      (data) {
        emit(DataLoaded<T>(data: data));
      },
    );
  }
}
