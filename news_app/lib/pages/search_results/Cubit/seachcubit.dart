import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/search_results/Cubit/searchstates.dart';
import 'package:news_app/pages/search_results/Repo/searchrepo.dart';

class SearchCubit extends Cubit<Searchstates> {
  SearchCubit() : super(InitialState());

  Future<void> search(String query) async {
    if (query.isEmpty) {
      emit(InitialState());
      return;
    } else {
      emit(Loadingstate());
      try {
        final data = await SearchRepo.getTopsearchresults(query);
        emit(Successstate(data!));
      } catch (e) {
        emit(Errorstate(Future.error(e).toString()));
      }
    }
  }
}
