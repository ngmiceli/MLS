$(document).ready(function() {
    if($('#login-email').length)
        $('#login-email').watermark("Email Address");
    if($('#login-password').length)
        $('#login-password').watermark("Password");
    if($('#college_profile_gpa').length)
        $('#college_profile_gpa').mask('9?.99');
    if($('#college_profile_year').length)
        $('#college_profile_year').mask('99?99');
});