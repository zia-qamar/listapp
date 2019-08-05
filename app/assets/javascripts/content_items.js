// $(function() {
//     initUserUpdateBtn();
// });
//
// function initUserUpdateBtn() {
//     $('[id^="update_user_"]').off('click');
//     $('[id^="update_user_"]').on('click', function() {
//         var id = $(this).data('id');
//         $.ajax({
//             url: institution_subdomain +  '/users/' + id,
//             type: 'patch',
//             data: {'user' : {'is_active' : $(this).data('is-active')} },
//             dataType: 'json',
//             success: function (data) {
//                 $(('#user_' + id)).html(data.html);
//                 initUserUpdateBtn();
//                 $('#success_msg').text('User updated successfully.');
//                 $('#success_div').show().delay(2000).fadeOut();
//             },
//             error: function (data) {
//                 $('#error').html('Something went wrong. Please try again later.');
//             }
//         });
//     });
// }
