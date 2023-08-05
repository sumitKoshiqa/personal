abstract class Routes {
  Routes._();

  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const VERIFY_OTP = '/verify-otp';
  static const CONSUMER_CREATE_PROFILE = '/create-profile-consumer';
  static const CONSUMER_PROFILE = '/consumer/profile';
  static const CONSUMER_HOME = '/consumer';
  static const CONSUMER_DIET = '/consumer/diet';
  static const CONSUMER_APPOINTMENT = '/consumer/appointment';
  static const CONSUMER_PAST_APPOINTMENT = '/consumer/past-appointments';
  static const CONSUMER_ANSWERS = '/consumer/answers';
  static const CONSUMER_RECOMMENDATIONS = '/consumer/recommendations';
  static const CONSUMER_SUPPLEMENTS = '/consumer/supplements';
  static const CONSUMER_SUPPLEMENTS_DETAIL = '/consumer/supplements/details';
  static const CONSUMER_LIFESTYLE = '/consumer/lifestyle';
  static const CONSUMER_SPECIALITY = '/consumer/speciality';
  static const CONSUMER_YOGA = '/consumer/yoga';
  static const CONSUMER_YOGA_PLAN = '/consumer/yoga/plan';
  static const CONSUMER_DISEASE = '$CONSUMER_SPECIALITY/disease';
  static const CONSUMER_SELECT_PHASE = '$CONSUMER_DISEASE/phase';
  static const CONSUMER_QUESTIONS = '$CONSUMER_SELECT_PHASE/questions';
  static const CONSUMER_QUESTIONS_PREVIEW = '$CONSUMER_SELECT_PHASE/questionsPreview';
  static const CONSUMER_UPCOMING_APPOINTMENTS = '/consumer/appointments';
  static const CONSUMER_MEDICAL_REPORTS = '/consumer/medical-reports';
  static const CONSUMER_FORMS = '/consumer/assessment-forms';
  static const BOOK_APPOINTMENT = '/consumer/book-appointment';
  static const CART_PAGE = '/consumer/supplements/cart';
  static const CONSUMER_RESCHEDULE_APPOINTMENT = '/consumer/reschedule-appointment';
  static const THANKU_PAGE = '/consumer/workflow-submit';
  static const CONSUMER_TERMS = '/terms';
  static const CONSUMER_SUSCRIPTION_SUCCESS = '/subscriptionSuccess';
  static const CONSUMER_DISEASE_HOME_PAGE = '/consumer/diseaseHomePage';

  static const AUTHENTICATION_HOME = '/home';
  static const SUBSCRIPTION = '/subscription';
  static const IN_APP_UPDATE = '/app-update';

  // https://app-uat.lybl.com/home?accessToken=e5d43bde-d993-4f82-b118-d61e5bf5dc3b

  static const DOCTOR_CREATE_PROFILE = '/create-profile-health-expert';
  static const DOCTOR_HOME = '/healthExpert';
  static const DOCTOR_AVAILABILITY = '/healthExpert/availability';
  static const DOCTOR_ADD_AVAILABILITY = '/healthExpert/addAvailability';
  static const DOCTOR_APPOINTMENTS = '/healthExpert/appointments';
  static const DOCTOR_MEDICAL_REPORTS = '/healthExpert/medical-reports';
  static const DOCTOR_SPECIALITY_DOC = '/healthExpert/speciality';
  static const DOCTOR_DISEASE_DOC = '$DOCTOR_SPECIALITY_DOC/disease';
  static const DOCTOR_SELECT_PHASE_DOC = '$DOCTOR_SPECIALITY_DOC/disease/phase';
  static const DOCTOR_QUESTIONS_DOC =
      '$DOCTOR_SPECIALITY_DOC/disease/phase/questions';
  static const DOCTOR_QUESTIONS_PREVIEW_DOC =
      '$DOCTOR_SPECIALITY_DOC/disease/phase/questionsPreview';
  static const DOCTOR_PATIENTS = '/healthExpert/patients';
  static const DOCTOR_PATIENT_KUNDALI = '/healthExpert/patient-kundali';
  static const THANKU_PAGE_DOC = '/healthExpert/workflow-submit';
}
