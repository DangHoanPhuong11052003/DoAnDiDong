class SignUp_AccountFailure {
  final String message;

  const SignUp_AccountFailure([this.message = 'Đã xảy ra lỗi không xác định']);

  factory SignUp_AccountFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUp_AccountFailure('Vui lòng thử mật khẩu mạnh hơn');
      case 'invalid-password':
        return const SignUp_AccountFailure('Email không chính xác hoặc sai định dạng');
      case 'email-already-in-use':
        return const SignUp_AccountFailure('Tài khoản sử dụng Email đã tồn tại');
      case 'operation-not-allowed':
        return const SignUp_AccountFailure('Hoạt động không cho phép. Vui lòng liên hệ bộ phận hỗ trợ');
      case 'user-disable':
        return const SignUp_AccountFailure('Tài khoản không khả dụng. Vui lòng liên hệ bộ phận hỗ trợ');
      default:
        return const SignUp_AccountFailure();
    }
  }
}
