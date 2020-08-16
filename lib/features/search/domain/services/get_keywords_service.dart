import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/services/Service.dart';
import '../repository/search_repository.dart';

class GetKeywordsService extends Service<List<String>, NoParams> {
  final SearchRepository repository;

  GetKeywordsService({@required this.repository});
  @override
  Future<Either<Failure, List<String>>> exec(NoParams params) async {
    return repository.recentKeywords();
  }
}
