import '../../data/models/models.dart';

import '../../domain/entities/account_entity.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<AccountEntity> auth(AuthenticationParams params)async{

    try {
     final httpResponse = await httpClient.request(url: url, method: "post", body: RemoteAuthenticationParams.fromDomain(params).toJson()); 
     return RemoteAccountModel.fromJson(httpResponse).toEntity();
    } on HttpError  catch(error) {
     throw error == HttpError.unauthorized ?  DomainError.invalidCredentials :  DomainError.unexpected;
    }

  }
}


class RemoteAuthenticationParams{
  final String email;
  final String password;

  RemoteAuthenticationParams({
    required this.email,
    required this.password
  });

factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) => RemoteAuthenticationParams(email: params.email, password: params.password);

//Converte a instância dele mesmo em um map
Map toJson() => { 'email':email, 'password':password };

}