import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/networking/api/api_constants.dart';
import 'package:online_exam/core/networking/common/api_result.dart';
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/data/models/request/VerifyResetCodeRequest.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/data/models/response/ForgotPasswordResponse.dart';
import 'package:online_exam/features/auth/data/models/response/VerifyResetCodeResponse.dart';
import 'package:online_exam/features/auth/data/models/response/auth_response_model.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/exam/data/models/response/exam_response_model.dart';
import 'package:online_exam/features/questions/data/models/question_response_model.dart';
import 'package:online_exam/features/survey/data/models/subject_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
@factoryMethod
factory  ApiManager(Dio dio)= _ApiManager;
@POST(ApiConstants.forgotPasswordApi)
  Future<ForgotPasswordResponse> forgotPassword(@Body() ForgetPasswordRequest body) ;
@POST(ApiConstants.verifyResetCodeApi)
  Future<VerifyResetCodeResponse> verifyResetCode(@Body() VerifyResetCodeRequest body);
@PUT(ApiConstants.resetPasswordApi)
  Future<AuthResponse> resetPassword(@Body() ResetPasswordRequest body);
@POST(ApiConstants.signInApi)
Future<AuthResponse> signIn(@Body() SignInRequest user);
@POST(ApiConstants.registerApi)
Future<AuthResponse> signUp(@Body() RegisterRequest user);
@GET(ApiConstants.examApi)
Future<ExamResponseModel> getExamsBySubjectId(
      @Query("subject") String subjectId);
  @GET(ApiConstants.subjectsEndPoint)
  Future<SubjectResponseModel> getSubjectList();
@GET(ApiConstants.questionsApi)
Future<QuestionResponseModel>  getQuestionsByExamId(@Query("exam") String examId);
@GET(ApiConstants.profileDataApi)
Future<AuthResponse> getProfileData();
@PUT(ApiConstants.editProfileApi)
Future<AuthResponse> editProfile(@Body() User body);
@PATCH(ApiConstants.changePasswordApi)
Future<AuthResponse> changePassword(@Body() ChangePasswordRequest  body);


}
