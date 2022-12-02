

class ApiPaths {
  static String liveBaseURL = "https://www.api.ahjili.com/api/";
  static String baseURL = liveBaseURL;

  // endpoints
  // static String rider = "rider/";

  // User Auth Apis
  static String login =  "${baseURL}login";
  static String register =  "${baseURL}register";
  static String requestOtp =  "${baseURL}request_otp";
  static String verifyOtp =  "${baseURL}verify_otp";
  static String resetPassword =  "${baseURL}reset_password";
  static String logout =  "${baseURL}logout";

  // User Profile Apis
  static String checkUsername =  "${baseURL}check_username";
  static String checkNumber =  "${baseURL}check_number";
  static String checkEmail =  "${baseURL}check_email";
  static String getUserProfile =  "${baseURL}get_user_profile";
  static String getOtherUserProfile =  "${baseURL}get_profile";
  static String followUnfollow =  "${baseURL}follow_unfollow";
  static String updateUserProfileImage =  "${baseURL}update_profile_image";
  static String updateUserProfile =  "${baseURL}update_profile";

  // Chat Apis
  static String getUserChats =  "${baseURL}getContacts";
  static String getMessages =  "${baseURL}fetchMessages";

  // Feed Apis
  static String fetchPosts =  "${baseURL}get_all_post";
  static String fetchExplore =  "${baseURL}get_all_post_images";
  static String fetchReels =  "${baseURL}get_all_post_vedios";
  static String fetchStories =  "${baseURL}new_get_stories";
  static String postComments =  "${baseURL}post_comments";
  static String addComment =  "${baseURL}comment_add";
  static String likePost =  "${baseURL}like_post";

  // Upload Apis
  static String uploadPost =  "${baseURL}create_user_post";
  static String uploadStory =  "${baseURL}save_user_story";


}
